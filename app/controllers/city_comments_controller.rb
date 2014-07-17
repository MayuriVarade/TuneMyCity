class CityCommentsController < ApplicationController

     def show
     @user = User.find_by_id(current_user2)
     redirect_to :back
     end


	 def create

	 	if params["device"] == "mobile" 
        city_comment = {}
        city_comment['body'] = params[:body]
        city_comment['city_photo_id'] = params[:city_photo_id]
        # comment['initiative_description'] = params[:initiative_description]
        @city_comment = CityComment.new(city_comment)
        @city_comment.save!
        render :status =>200 ,:json => @city_comment.to_json 
        
        else
        @city_photo = CityPhoto.find(params[:city_photo_id])
        @city_comment = @city_photo.city_comments.create!(params[:city_comment])
        @city_comment.user = current_user
        redirect_to @city_photo
        end
     end

      def destroy
      @city_comment = CityComment.find(params[:id])
      @city_comment.destroy

      redirect_to :back
  end
end
