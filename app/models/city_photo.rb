require 'obscenity/active_model'
class CityPhoto < ActiveRecord::Base
  attr_accessible :about, :is_approved, :name, :title, :user_id, :image, :city_name, :body, :user_id, :city_photo_id, :likes, :country_id, :state_id, :city_id
  has_attached_file :image, :styles => { :thumb => "100x100>",:medium => "350x350" },
  processors: [:thumbnail, :compression],
    :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => ":rails_root/public/attachments/city_photos/:id/:style/:basename.:extension",
                    
                    :convert_options => {
                          :thumb => "-compose Copy -gravity center -extent 100x100",
                          :medium => "-compose Copy -gravity center -extent 350x350",
                          
                      }


 validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
  # validate :image_dimensions
  # do_not_validate_attachment_file_type :image
  has_many :city_comments
  belongs_to :user
  has_many :cities
  validates :title,  obscenity: { sanitize: true, replacement: :stars  } 
 # validates_uniqueness_of :title,:presence => {:message => 'Title already exists'}
  acts_as_likeable
  
    def likes1(id)
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
  # def validate_each(record, attribute, value)
  #   if record.send("#{attribute}?".to_sym)
  #     dimensions = Paperclip::Geometry.from_file(value.queued_for_write[:original].path)
  #     width = options[:width]
  #     height = options[:height]

  #     record.errors[attribute] << "Width must be #{width}px" unless dimensions.width == width
  #     record.errors[attribute] << "Height must be #{height}px" unless dimensions.height == height
  #   end
  # end
 # private

 #  def image_dimensions
 #    required_width  = 640
 #    required_height = 465
 #    dimensions = Paperclip::Geometry.from_file(image.queued_for_write[:original].path)

 #    errors.add(:image, "Width must be #{required_width}px") unless dimensions.width == required_width
 #    errors.add(:image, "Height must be #{required_width}px") unless dimensions.height == required_height
 #  end


end
