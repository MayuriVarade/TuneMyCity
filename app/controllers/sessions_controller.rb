class SessionsController < ApplicationController
layout 'header'
def index
  @user = User.all
  @user1 = Hash["user" => @user]
      respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @user1 }
  end
  
end

def new
render :layout => 'header'
end

def create
  if params[:device] == 'mobile' 
   user = User.authenticate(params[:email], params[:password])
        
          if user.nil? 
            flash.now[:error] = "Invalid email/password combination."
            @title = "Sign in"
            render 'new'
          else 
          sign_in user
          @user = current_user2.id
          render :status =>200,:json => @user.to_json
          end
  else
 user = User.authenticate(params[:email], params[:password])
 if user.nil? 
      flash.now[:error] = "Invalid email/password combination."
       @title = "Sign in"

       render 'new'
    else 
    sign_in user
    if params[:remember_me]
      cookies.permanent[:auth_token] = user.auth_token
    else
      cookies[:auth_token] = user.auth_token
    end
       redirect_to root_url, :notice => "Logged in!"
     end
   end
end

def destroy
  sign_out
  session[:user_id] = nil
  redirect_to root_path, :notice => "Logged out!"
end


end

  