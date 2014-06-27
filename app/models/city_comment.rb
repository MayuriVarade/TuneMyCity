require 'obscenity/active_model'
class CityComment < ActiveRecord::Base
  belongs_to :city_photo
  attr_accessible :body, :city_photo_id, :user_id
  belongs_to :user
  validates :body,  obscenity: { sanitize: true, replacement: :stars  } 
end
