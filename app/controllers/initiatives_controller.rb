class InitiativesController < ApplicationController
  
    before_filter :authenticate, except: [:index,:comments, :create]
    helper_method :sort_column, :sort_direction
  # GET /initiatives
  # GET /initiatives.json
  def index
    @initiatives = Initiative.find_all_by_city_id(current_user2.city_id)
    @user = User.find_by_id(current_user2)

    @hash = Gmaps4rails.build_markers(@initiatives) do |initiative, marker|
      marker.lat initiative.latitude
      marker.lng initiative.longitude
      marker.title initiative.title
      marker.infowindow initiative.initiative_description
    end
    #    @initiatives
    #  else
    #   "abcd"
    # end
    @initiative1 = Hash["initiative" => @initiatives]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @initiative1 }
    end
   
  end

  # GET /initiatives/1
  # GET /initiatives/1.json
  def show
    @initiative = Initiative.find(params[:id])
    @user = User.find_by_id(current_user2)
    
     # @city= City.find_by_id(@initiative.city_id)
  # raise @city.inspect
    @hash = Gmaps4rails.build_markers(@initiative) do |initiative, marker|
      marker.lat initiative.latitude
      marker.lng initiative.longitude
      marker.title initiative.title
      marker.infowindow initiative.initiative_description
      
      if ((@initiative.initiative_description)[/\d+/].to_i > 2000000) 
         img = "/images/bigcity.png"
      else 
         img = "/images/smallcity.png" 
      end
      marker.picture({
       "url" => img,
       "width" =>  32,
       "height" => 32})
       
    end    
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @initiative }
      
      
    end

  end


def comments
 @initiative = Initiative.find(params[:id])
 @user = User.find_by_id(current_user2)
 @comment= Comment.where(:initiative_id => @initiative)
  # raise @comment.inspect
  @comment1 = Hash["initiative_comments" => @comment]
   render :status =>200 ,:json => @comment1.to_json
  # raise @comment1.inspect
   # respond_to do |format|
   #    format.html # show.html.erb
   #    format.json { render json: @comment1 }
   #  end
  
end
  # GET /initiatives/new
  # GET /initiatives/new.json
  def new
    @initiative = Initiative.new
    @user = User.find_by_id(current_user2)
    @city = City.all
      respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @initiative }
    end
  end

  # GET /initiatives/1/edit
  def edit
    @initiative = Initiative.find(params[:id])
    @user = User.find_by_id(current_user2)
  end

  # POST /initiatives
  # POST /initiatives.json
  def create
     @user = User.find_by_id(current_user2)
      if params["device"] == "mobile" 
        initiative = {}
        initiative['initiative_category'] = params[:initiative_category]
        initiative['initiative_description'] = params[:initiative_description]
        initiative['initiative_name'] = params[:initiative_name]
        initiative['latitude'] = params[:latitude]
        initiative['longitude'] = params[:longitude]
        initiative['user_id'] = params[:user_id]
        initiative['city_id'] = params[:city_id]
        initiative['name'] = params[:name]
        initiative['image'] = params[:image]
        @initiative = Initiative.new(initiative)
        @initiative.save!
        render :status =>200 ,:json => @initiative.to_json
       else
        @initiative = Initiative.new(params[:initiative])
        respond_to do |format|
            if @initiative.save
              format.html { redirect_to @initiative, notice: 'Initiative was successfully created.' }
              format.json { render json: @initiative, status: :created, location: @initiative }
            else
              format.html { render action: "new" }
              format.json { render json: @initiative.errors, status: :unprocessable_entity }
            end
          end
      end  
  end


  def vote_for_initiative
    @initiative = Initiative.find(params[:id])
    current_user2.vote_for(@initiative).inspect 
     if (@initiative.votes_for).to_i == 15
     @user= User.find_by_id(@initiative.user_id)
     reputation_count = @user.reputation
     @initiatives1 = @user.update_column(:reputation,reputation_count+10)
    end
     redirect_to :back,:notice => "You have voted successfully"
      
      rescue ActiveRecord::RecordInvalid
        redirect_to :back,:notice => "You have already voted for this one"
       
    # respond_to do |format|
    #   format.js
    # end
end


  def vote_against_initiative
      @initiative = Initiative.find(params[:id])
      current_user2.vote_against(@initiative)
      redirect_to :back
        flash[:sucess] = "You have voted successfully."
        rescue ActiveRecord::RecordInvalid
        redirect_to :back
        flash[:error] = "You have already voted for this one."
      # respond_to do |format|
      #   format.js
      # end
  end
  def like_initiative
    @initiative =Initiative.find_by_id(params[:id])
    current_user2.like!(@initiative)
    @likes= @initiative.likes(@initiative.id)
      @count ||= []
       @likes.each do |like|
       @count << like.count
       end
       @counts = @initiative.sum_counts(@count)
     respond_to do |format|
     format.js {}

    end
  end
   def like_count_initiative
    @initiative=Initiative.find_by_id(params[:id])
     @likes = @initiative.likes(@initiative.id) rescue nil
     @likes1 = Hash["likes" => @likes]
     respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @likes1 }
     end
     
     
  end


def search
  q = params[:q]
  @initiatives =Initiative.ransack(initiative_name_cont: q).result 
  @city_photos = CityPhoto.ransack(title_cont: q).result
  
  @user = User.find_by_id(current_user2)
end

# Approval from admin for initiative and For each posted Approved Initiative, user's reputation count will increase by '10'.

   def approve
    # raise @user.inspect
          @initiatives = Initiative.find(params[:id])
          @initiatives.is_approved = !@initiatives.is_approved?
          @initiatives.update_column(:is_approved,true)  
            # if @initiatives.is_approved
          @user= User.find_by_id(@initiatives.user_id)
          reputation_count = @user.reputation
          @initiatives1 = @user.update_column(:reputation,reputation_count+10)
            # end
          @initiatives.save!
           
          redirect_to :back
  end

  def cancel
     @initiatives = Initiative.find(params[:id])
     @initiatives.is_approved = !@initiatives.is_approved?
     @initiatives.save!
     redirect_to :back
  end
  # PUT /initiatives/1
  # PUT /initiatives/1.json
  def update
    @initiative = Initiative.find(params[:id])
     
    respond_to do |format|
      if @initiative.update_attributes(params[:initiative])
       
        format.html { redirect_to @initiative, notice: 'Initiative was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @initiative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /initiatives/1
  # DELETE /initiatives/1.json
  def destroy
    @initiative = Initiative.find(params[:id])
    @initiative.destroy

    respond_to do |format|
      format.html { redirect_to initiatives_url }
      format.json { head :no_content }
    end
  end
end



  private
 def authenticate
      deny_access unless signed_in?
end

  
  def sort_column
    Initiative.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end