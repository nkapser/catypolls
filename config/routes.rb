ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"
  map.root :controller => "home"
  map.about_us '/about-us', :controller => 'home', :action => 'aboutus'
  map.privacy_policy '/privacy-policy', :controller => 'home', :action => 'privacypolicy'
  
  map.activate '/activate/:activation_code', :controller => 'activations', :action => 'create'  

  map.resource :user_session
  map.login 'user/login', :controller => "user_sessions", :action => "new" # optional, this just sets the root route
  map.logout 'user/logout', :controller => "user_sessions", :action => "destroy" # optional, this just sets the root route

  map.resource :account, :controller => "users"
  map.resources :users

  map.external 'poll/:category/:name/:uniqueid', :controller => 'polls', :action => 'view'
  map.poll_result 'polls/result/:category/:name/:uniqueid', :controller => 'polls', :action => 'result'
  map.voting 'poll/:uniqueid/vote', :controller => 'polls', :action => 'vote'
  map.publish_poll 'polls/:id/publish', :controller => "polls", :action => "publish"
  map.resources :polls do |poll|
    poll.resources :discussions
  end

  map.category_polls '/:category/polls', :controller => 'categories', :action => "index"
  map.discussion '/discussion/:poll_unique_id', :controller => 'discussions', :action => 'new'

  map.connect '/contactus-response', :controller => 'contactus', :action => 'contactus_response'
  map.resource :contactus, :controller => 'contactus', :only => [:new, :create, :show]
  
  map.search '/search', :controller => 'search', :action => 'index'

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
