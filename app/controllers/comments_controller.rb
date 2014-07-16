class CommentsController < ApplicationController
  
  # def show
  #   @user = User.find_by_id(current_user2)
  #   redirect_to initiatives_url
  # end

	def create
		if params["device"] == "mobile" 
        comment = {}
        comment['body'] = params[:body]
        comment['initiative_id'] = params[:initiative_id]
        # comment['initiative_description'] = params[:initiative_description]
        @comment = Comment.new(comment)
        @comment.save!
        render :status =>200 ,:json => @comment.to_json 
        
        else
       @initiative = Initiative.find(params[:initiative_id])
       # raise  @initiative.inspect
       @comment = @initiative.comments.create!(params[:comment])
       # raise  @comment.inspect
        @comment.user = current_user

       redirect_to @initiative
        end        
     end

  #    def destroy
  #     @comment = Comment.find(params[:id])
  #     @comment.destroy

  #     respond_to do |format|
  #     format.html { redirect_to initiatives_url }
  #     format.json { head :no_content }
  #   end
  # end

end

