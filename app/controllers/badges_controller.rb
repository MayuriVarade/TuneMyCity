class BadgesController < ApplicationController
	  before_filter :authenticate
def index
    @badges = Badge.all
    @user = User.find_by_id(current_user2)
    respond_to do |format|
    format.html # index.html.erb
    end

  end

  # GET /city_photos/1
  # GET /city_photos/1.json
  def show
    @badge = Badge.find(params[:id])
    @user = User.find_by_id(current_user2)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @badge }
    end
  end

  # GET /city_photos/new
  # GET /city_photos/new.json
  def new
    @badge = Badge.new
    @user = User.find_by_id(current_user2)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @badge }
    end
  end

  # GET /city_photos/1/edit
  def edit
    @badge = Badge.find(params[:id])
    @user = User.find_by_id(current_user2)
  end

  # POST /city_photos
  # POST /city_photos.json
  def create
        @badge = Badge.new(params[:badge])
         # @city_photo.likes=0
         respond_to do |format|
            if @badge.save
              format.html { redirect_to @badge, notice: 'Badge was successfully created.' }
              format.json { render json: @badge, status: :created, location: @badge }
            else
              format.html { render action: "new" }
              format.json { render json: @badge.errors, status: :unprocessable_entity }
         end
  end

  # PUT /city_photos/1
  # PUT /city_photos/1.json
  def update
    @badge = Badge.find(params[:id])

    respond_to do |format|
      if @badge.update_attributes(params[:badge])
        format.html { redirect_to @badge, notice: 'City photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /city_photos/1
  # DELETE /city_photos/1.json
  def destroy
    @badge = Badge.find(params[:id])
    @badge.destroy

    respond_to do |format|
      format.html { redirect_to badges_url }
      format.json { head :no_content }
    end
  end
end

private
 def authenticate
      deny_access unless signed_in?
end
end
