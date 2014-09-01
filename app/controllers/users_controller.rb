class UsersController < ApplicationController
  layout :custom_layout
 require 'will_paginate/array'
  def new
    @user = User.new
     
  end
 #    def admin
  #   @user = User.new
  # end
def create
  # unless User.eamil.present?
    if (params["device"] == "mobile")
     user = {}
     user['name'] = params[:name]
     user['email'] = params[:email]
     user['password'] = params[:password]
     user['password_confirmation'] = params[:password_confirmation]
     user['auth_token'] = params[:auth_token]
     @user = User.new(user)
     @user.save!
     render :status =>200 ,:json => @user.to_json
    else
     @user = User.new(params[:user])
        if @user.save
        redirect_to log_in_path,:flash => {:notice => "Signed up successfully!"}
        else
        render "new"
        end
     end
end

def show
@user = User.find(params[:id])
end

def edit
    @user = User.find(params[:id])

end 

 def update
  @user = User.find(params[:id])
    if params[:user][:password].blank?
      params[:user].delete :password
      params[:user].delete :password_confirmation
    end
  
     if @user.update_attributes(params[:user])
        # flash[:notice] = "Profile updated."
        if current_user2.role? :user
            redirect_to root_path
        else
            if current_user2.authentications.find_by_user_id(@user.id)
              redirect_to ("/dashboard")
            else
              redirect_to ("/dashboard")
            end
        end
      else
        @title = "Edit user"
        render 'edit'
      end
  end
  def dashboard
      @user = User.find_by_id(current_user2)
      @users = User.all
      @bagde = Badge.all
    # raise (@user).inspect

# raise (current_user2.role? :Cityadmin).inspect
       if (signed_in?) and (current_user2.role? :Cityadmin)
         @initiatives = Initiative.paginate(:page => params[:page],:per_page => 10,:order => "created_at DESC")
         @city_photos = CityPhoto.all
       elsif (signed_in?) and (@user)
         @initiatives = Initiative.find_all_by_city_id(current_user2.city_id).paginate(:page => params[:page],:per_page => 3,:order => "created_at DESC")
         @city_photos = CityPhoto.find_all_by_city_id(current_user2.city_id).paginate(:page => params[:page],:per_page => 3,:order => "created_at DESC")
       else
         @initiatives = Initiative.paginate(:page => params[:page],:order => "created_at DESC",:per_page => 10)
         @city_photos = CityPhoto.paginate(:page => params[:page],:order => "created_at DESC",:per_page =>10)
    end
   
  end
  def select
   @user = User.find_by_id(current_user2) 
   @country =Country.all
   @city = City.all
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

  def check_name
    @user = User.find_by_username(params[:user][:name])
      respond_to do |format|
          format.json { render :json => !@user }
     end
  end

  def custom_layout
        case action_name
         when "create"
          "header"
           when "new"
          "header"
           when "show"
          "header"
           when "select"
            "application"
          else
          "application"
        end
    end
    
end
