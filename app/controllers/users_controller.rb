class UsersController < ApplicationController

	def new
	  @user = User.new
      render :layout => 'header'
	end
    def admin
	  @user = User.new
	end
	def create
	  @user = User.new(params[:user])

	  if @user.save
	  redirect_to root_path, :notice => "Signed up!"
	  else
	  render "new"
	  end
	end

	def dashboard
		  @user = User.find_by_id(current_user2)
     @users = User.all
     # raise @users.inspect
	    @initiatives = Initiative.all
	    @city_photos = CityPhoto.all
	  
	end

	   #method for change the users password to new password.
   def change_password

    @user = User.find(current_user.id)
    
    if request.post?
      if User.authenticate(@user.email,
        params[:change_password][:old_password]) == @user
        @user.password = params[:change_password][:new_password]
        @user.password_confirmation =
        params[:change_password][:new_password_confirmation]

          if @user.save
            flash[:notice] = 'Password successfully updated'
            redirect_to change_password_path
          else
            flash[:error] = 'New password mismatch'
            render :action => 'change_password'
          end
      else
          flash[:error] = 'Old password incorrect'
          render :action => 'change_password'
      end
    end
   end
   def check_email
    @user = User.find_by_email(params[:user][:email])
      respond_to do |format|
      format.json { render :json => !@user }
     end
  end
end
