class SessionsController < ApplicationController
def new
render :layout => 'header'
end

def create
   user = User.authenticate(params[:email], params[:password])
  
    if user 
    sign_in user
    session[:user_id] = user.id 
    redirect_to dashboard_path, :notice => "Logged in!"
  else

    flash.now.alert = "Invalid email or password"
    render "new"
  end

end

def destroy
  sign_out
  session[:user_id] = nil
  redirect_to root_path, :notice => "Logged out!"
end


end
