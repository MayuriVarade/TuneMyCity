Tunemycity::Application.routes.draw do

  resources :city_comments


  resources :comments
  resources :password_resets
  match "/signout" => "sessions#destroy", :as => :signout
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new"
  get "dashboard" => "users#dashboard", :as => "dashboard"
  match '/auth/:provider/callback', to: 'authentications#create'
  match '/auth/:provider', to: 'authentications#create', :as => "authentication_fb"
  match 'auth/failure', to: redirect('/')
  match '/initiatives/:id/approve' => 'initiatives#approve'
  match '/initiatives/:id/cancel' => 'initiatives#cancel'
  match '/city_photos/:id/is_approved', :to => "city_photos#toggled_status"
  get "likes"  => "city_photos#likes", :as => "likes"

  root :to => "users#dashboard"

  get "password_resets/new"
  match '/change_password', :controller => 'users', :action => 'change_password'
  match "/select" => "users#select"

  resources :users
  resources :badges
  resources :sessions
  resources :categories
  resources :city_photos do 
  resources :city_comments, :only => [:create]
     collection do
     
      post :like_city_photo
      get :like_count
    end
 end
  get 'city_photos/index'
  get 'city_photos/edit'
  get 'city_photos/new'

  resources :authentications

  resources :initiatives do
      member do
      post :vote_for_initiative
      post :vote_against_initiative
    end
    collection do
     
      post :like_initiative
      get :like_count_initiative
    end

    resources :comments, :only => [:create]
  end
  match '/search' => 'initiatives#search'
  match '/initiatives/:id/comments', :to => "initiatives#comments"
  match '/city_photos/:id/city_comments', :to => "city_photos#city_comments"
  match '/initiatives/:id/like_count_initiative', :to =>"initiatives#like_count_initiative"
  match '/users/validations/check_email', :to=>"users#check_email"
  get 'initiatives/index'
  get 'initiatives/edit'
  get 'initiatives/new'
  get 'initiatives/show'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
