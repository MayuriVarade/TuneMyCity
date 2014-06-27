class State < ActiveRecord::Base
  attr_accessible :country_id, :name
  belongs_to :country
  has_many :users
  has_many :cities

end
