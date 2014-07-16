class Badge < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :image
  has_attached_file :image, :styles => { :thumb => "150x150>" },
    :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => ":rails_root/public/attachments/badges/:id/:style/:basename.:extension",
                    
                    :convert_options => {
                          :thumb => "-compose Copy -gravity center -extent 140x100",
                          :medium => "-compose Copy -gravity center -extent 350x350",
                          
                      }
validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
end
