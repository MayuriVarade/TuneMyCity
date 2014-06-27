class Like < Socialization::ActiveRecordStores::Like
     # validates :liker_id, :presence => {:if => :liker_id?}
     # validate :like_validation
     # validates_uniqueness_of :likeable_id,:count ,:scope => [:likeable_type, :liker_type,:liker_id]
     # validates :likeable_id, :presence => true, :uniqueness => true, :length => { :maximum => 1 }
     # validates_uniqueness_of :voteable_id, :scope => [:voteable_type, :voter_type, :voter_id]
	def self.like!(liker, likeable)
      unless likes?(liker, likeable)
       self.create! do |like|
       like.liker = liker
       like.likeable = likeable
       like.count = 1

        end
       call_after_create_hooks(liker, likeable)
       true
       else
       like = Like.find_by_liker_id_and_likeable_id(liker.id,likeable.id)
       count = 0
       if like.count == count+50 || (like.count.modulo(50).zero?)
         @user= User.find_by_id(liker.id)
         reputation_count = @user.reputation
         @user.update_column(:reputation,reputation_count+5)
       end
         like.count=like.count
         like.save
       end
   end
  


  # def like_validation
  #   if liker_id.present?
  #     errors.add(:likeable_id, "You have already liked this Initiative")
  #   end
  # end
end
