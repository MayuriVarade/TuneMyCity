class Category < ActiveRecord::Base
  attr_accessible :category, :user_id
  belongs_to :user

end
