require 'obscenity/active_model'
class Initiative < ActiveRecord::Base
  attr_accessible :about, :address, :is_approved, :is_developed, :latitude, :longitude, :name, :title, :user_id, :image, :initiative_description, :initiative_category, :initiative_name,:good_initiative
  has_attached_file :image, :styles => { :small => "150x150>" }
  has_attached_file :image, :styles => { :small => "150x150>" }
  # validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
  # validates :initiative_category, :presence => {:message => 'Initiative category cannot be blank'}
  # validates :initiative_description, :presence => {:message => 'Initiative description cannot be blank'}
  # validates :about, :presence => {:message => 'About cannot be blank'}
  # validates :address, :presence => {:message => 'Address cannot be blank'}
  # validates :latitude, :presence => {:message => 'Latitude cannot be blank'}
  # validates :longitude, :presence => {:message => 'Longitude cannot be blank'}
  # validates :name, :presence => {:message => 'Name cannot be blank'}
  # validates :initiative_name, :presence => {:message => ' Initiative Name cannot be blank'}
  validates :title,  obscenity: { sanitize: true, replacement: :stars  } 
   geocoded_by :address
   after_validation :geocode
   belongs_to :user
   has_many :comments
   has_many :initiative_counts
   acts_as_voteable
   acts_as_likeable
  
    def likes(id)
    Like.find_all_by_likeable_id(id) rescue nil
   
    end
 
    def sum_counts(count)
    count.inject{|sum,x| sum + x }
    end
   def set_user!(user)
    self.user_id = user.id

    self.save!
   end
    def as_json(options)
    json = super
    self.image.styles.each do | format |
      json = json.merge({"image_"+format[0].to_s => self.image(format[0])})
    end
    json
  end

 
end
 