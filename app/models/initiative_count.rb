class InitiativeCount < ActiveRecord::Base
  attr_accessible :downs, :initiative_id, :ups, :user_id, :good_initiative
  belongs_to :initiative
  # validates_uniqueness_of :ups, :downs
    # validates   :initiative_id, :uniqueness  => {:scope => :ups} 
   # validates_uniqueness_of :ups, :presence => true
   # validates_uniqueness_of :initiative_id, :scope => :user_id,  :message => "has already voted on that story."
 # validate :user_can_rate_after_one_day

#  before_save :default_values

# def default_values
#  self.initiativecount ||=0
# end

# protected
#   def user_can_rate_after_one_day
#    if InitiativeCount.where('ups like ?', '%1%')
#     return
     
#     else
#     	 self.errors.add(:rate,"you can only vote once per day") 
      
#     end
#   end
end
