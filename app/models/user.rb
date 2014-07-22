class User < ActiveRecord::Base
    attr_accessible :email, :password, :password_confirmation, :name,:country_id, :state_id, :city_id, :role_ids, :salt,:reputation, :username, :auth_token
    attr_accessor :password
    before_save :encrypt_password
    has_and_belongs_to_many :roles
    belongs_to :country
    belongs_to :state
    belongs_to :city
    has_many :categories
    has_many :initiatives
    has_many :authentications
    has_many :city_photos
    has_many :likes
    has_many :comments
    # validates :country_id, :presence => true
    # validates :state_id, :presence => true
    # validates :city_id, :presence => true
    acts_as_voter
    acts_as_liker
     # validates_uniqueness_of :reputation
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email,:name,:uniqueness => { :case_sensitive => false }
    validates :password, :confirmation => true,:on => :create
     # validates_uniqueness_of :email,:presence => {:message => 'email id already exists'},:format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
 
    # def has_voted?(initiative)
    #   # check to see if the user has voted on the story
    #   # something like
    #   !self.initiative.find_by_initiative_id(initiative).nil?
    # end

     before_create { generate_token(:auth_token) }
    def self.authenticate(email, password)
      user = find_by_email(email)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
    end
    
     def authenticated_networks
    # use INJECT!
      authenticated_networks = []
      self.authentications.each do |auth|
      authenticated_networks << auth[:provider]
     end
      authenticated_networks
     end

      #method for password reset
      def send_password_reset
        generate_token(:password_reset_token)
        self.password_reset_sent_at = Time.zone.now
        save!
        UserMailer.password_reset(self).deliver
      end
     #method for generating authentication token.
     def generate_token(column)
        begin
          self[column] = SecureRandom.urlsafe_base64
        end while User.exists?(column => self[column])
      end

    # def encrypt_password
    # self.encrypted_password = BCrypt::Password.create(password) if password.present?
    # end

    # def match_password(login_password="")
    #     BCrypt::Password.new(password) == login_password
    # end
    def encrypt_password
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end

    def authenticate(id, submitted_password)
        user = find_by_id(id)
        (user && user.has_password?(submitted_password)) ? user :nil
    end



    def self.authenticate_with_salt(id,cookie_salt)
      user = find_by_id(id)
      # (user && user.salt == cookie_salt) ? user :nil
    end
    
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    def make_salt
     secure_hash("#{Time.now.utc}--#{password}")
    end

    def role?(role)
      return !!self.roles.find_by_name(role.to_s)
    end

 
end

