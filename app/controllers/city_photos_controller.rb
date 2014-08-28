class CityPhotosController < ApplicationController

   before_filter :authenticate, except: [:index,:city_comments]
  # GET /city_photos
  # GET /city_photos.json
  # respond_to :html, :xml, :json
        require 'will_paginate/array'
  def index
     if (signed_in?)
     @city_photos = CityPhoto.find_all_by_city_id(current_user2.city_id).paginate(:page => params[:page],:per_page => 6,:order => "created_at DESC")
     @user = User.find_by_id(current_user2)
# raise  @city_photos1.inspect
    @city_photos1 = Hash["city_photo" => @city_photos]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @city_photos1 }
      format.js
    end
  else
    @city_photos = CityPhoto.all
      @user = User.find_by_id(current_user2)
    @city_photos1 = Hash["city_photo" => @city_photos]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @city_photos1 }
    end
  end
  end

  # GET /city_photos/1
  # GET /city_photos/1.json
  def show
    @city_photo = CityPhoto.find(params[:id])
    @city_comments = CityComment.where(:city_photo_id => @city_photo).paginate(:page => params[:page],:per_page => 4,:order => "created_at DESC")
    @user = User.find_by_id(current_user2)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @city_photo }
    end
  end

  # GET /city_photos/new
  # GET /city_photos/new.json
  def new
    @city_photo = CityPhoto.new
    @user = User.find_by_id(current_user2)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @city_photo }
    end
  end

  # GET /city_photos/1/edit
  def edit
    @city_photo = CityPhoto.find(params[:id])
    @user = User.find_by_id(current_user2)
  end

  # POST /city_photos
  # POST /city_photos.json
  def create
     if params["device"] == "mobile" 
        city_photo = {}
        city_photo['city_name'] = params[:city_name]
        city_photo['image'] = params[:image]
        @city_photo = CityPhoto.new(city_photo)
        @city_photo.save!
        render :status =>200 ,:json => @city_photo.to_json
   
      else
        @city_photo = CityPhoto.new(params[:city_photo])
        @user = User.find_by_id(current_user2)
         respond_to do |format|
            if @city_photo.save
              format.html { redirect_to @city_photo, notice: 'City photo was successfully created.' }
              format.json { render json: @city_photo, status: :created, location: @city_photo }
            else
              format.html { render action: "new" }
              format.json { render json: @city_photo.errors, status: :unprocessable_entity }
            end
         end
      end
  end
def city_comments
 @city_photo = CityPhoto.find(params[:id])
 @user = User.find_by_id(current_user2)
 @city_comment= CityComment.where(:city_photo_id => @city_photo)
  # raise @city_comment.inspect
  @city_comment1 = Hash["city_photo_comments" => @city_comment]
  # raise @city_comment1.inspect
   render :status =>200 ,:json => @city_comment1.to_json

  
end
  def like_city_photo
    @city_photo =CityPhoto.find_by_id(params[:id])
    current_user2.like!(@city_photo)
    @likes= @city_photo.likes(@city_photo.id)
      @count ||= []
       @likes.each do |like|
       @count << like.count
       end
       @counts = @city_photo.sum_counts(@count)
     respond_to do |format|
     format.js {}

    end

 end
  def like_count
     @city_photo=CityPhoto.find_by_id(params[:id])
     @likes = @city_photo.likes1(@city_photo.id) rescue nil
     @likes1 = Hash["likes" => @likes]
     respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @likes1 }
     end
     
  end

  
  def toggled_status
        @city_photo = CityPhoto.find(params[:id])
        @city_photo.is_approved = !@city_photo.is_approved?
        @city_photo.save!
        redirect_to :back
 end
  # PUT /city_photos/1
  # PUT /city_photos/1.json
  def update
    @city_photo = CityPhoto.find(params[:id])

    respond_to do |format|
      if @city_photo.update_attributes(params[:city_photo])
        format.html { redirect_to @city_photo, notice: 'City photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @city_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /city_photos/1
  # DELETE /city_photos/1.json
  def destroy
    @city_photo = CityPhoto.find(params[:id])
    @city_photo.destroy

    respond_to do |format|
      format.html { redirect_to city_photos_url }
      format.json { head :no_content }
    end
  end
end

private
 def authenticate
      deny_access unless signed_in?
end