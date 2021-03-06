Catalogue::Application.routes.draw do
  get "user/sign_in"

  root :to => "catalogue#index"
  
  match 'user/log-in' => 'user#sign_in', :as => 'sign_in'
  match 'user/log-out' => 'user#sign_out'

  match 'user/collection' => 'catalogue#user_collection'
  match 'catalogue/recently-viewed' => 'catalogue#recently_viewed_datasets'

  match 'user/' => 'user#profile'

  match 'groups/' => 'groups#show'
  match 'community/groups' => 'groups#show'
  match 'community/datasets' => 'dataset#show'
  match 'datasets/show' => 'dataset#show'
  
  match 'contact-us' => 'about#contact_us'
  match 'terms-of-service' => 'about#terms_of_service'
  match 'privacy' => 'about#privacy'
  
  match 'api/' => 'api#builder'

  match 'parse_json' => 'tools#parse_json', :as=>:parse_json

  match 'catalogue/details/:id/*seo' => 'catalogue#details' 
  
  match 'search/status' => 'status#search'
  
  match 'api/shared-terms' => 'api#shared_terms'
  match 'api/related-datasets' => 'api#related_datasets'
  
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))'
end
