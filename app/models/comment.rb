require 'obscenity/active_model'
class Comment < ActiveRecord::Base
	 attr_accessible :body, :initiative_id,:user_id
     belongs_to :initiative
      belongs_to :user
      
      validates :body,  obscenity: { sanitize: true, replacement: :stars  } 
end
