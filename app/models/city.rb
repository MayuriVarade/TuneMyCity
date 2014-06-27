class City < ActiveRecord::Base
  attr_accessible :city_name, :state_id
    belongs_to :state
    has_many :users
end
