class AuthenticationsController < ApplicationController
  # include SessionsHelper
  # GET /authentications
  # GET /authentications.json
  def index
   @authentications = current_user2.authentications if current_user2
  end

  
  def create

    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
       
    if authentication
      
      flash[:notice] = "Signed in successfully."
      sign_in(authentication.user)
      redirect_to dashboard_path
    elsif current_user2
      current_user2.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to dashboard_path
    else
      @user = User.find_by_email(omniauth['info']['email'])
      
        if @user.nil?
          user = User.new
          user.email = omniauth['info']['email']
          user.name = omniauth['info']['name']
      
           # email: auth.uid+"@twitter.com"
          # user.id = omniauth['info']['user_id']
          user.picture_from_url(omniauth['info']['image']) rescue " "
          user.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
          user.save!
          sign_in user
          flash[:notice] = "Signed in successfully."
          redirect_to dashboard_path
        else
          flash[:error] = "Authentication Failed! You already have an account with the email address #{@user.email}"
          redirect_to ("/")
        end
    end
  end




def destroy
  @authentication = current_user2.authentications.find(params[:id])
  @authentication.destroy
  flash[:notice] = "Successfully destroyed authentication."
  redirect_to authentications_url
end


end
