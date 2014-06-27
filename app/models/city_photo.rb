require 'obscenity/active_model'
class CityPhoto < ActiveRecord::Base
  attr_accessible :about, :is_approved, :name, :title, :user_id, :image, :city_name, :body, :user_id, :city_photo_id, :likes
  has_attached_file :image, :styles => { :small => "150x150>" }
  do_not_validate_attachment_file_type :image
  has_many :city_comments
  belongs_to :user

  validates :title,  obscenity: { sanitize: true, replacement: :stars  } 
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
