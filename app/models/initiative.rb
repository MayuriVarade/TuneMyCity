require 'obscenity/active_model'
class Initiative < ActiveRecord::Base
  attr_accessible :about, :address, :is_approved, :is_developed, :latitude, :longitude, :name, :title, :user_id, :image, :initiative_description, :initiative_category, :initiative_name,:good_initiative
  

  has_attached_file :image, styles: {thumb: '150x150>',square: '1200x999#',medium: '200x200>'},
  :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => "public/attachments/initiatives/:id/:style/:basename.:extension",
                    
                    :convert_options => {
                          :thumb => "-compose Copy -gravity center -extent 140x100",
                          :medium => "-compose Copy -gravity center -extent 350x350",
                          
                      }
  # validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
 
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
 