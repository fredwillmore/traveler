Traveler::Application.routes.draw do
  resources :players

  resources :search_suggestions

  namespace :admin do
    root to: "dashboard#index"
    resources :action_types
    resources :curriculum_areas
    resources :place_types
    resources :quantities
    resources :users
    resources :players
    resources :item_types
    resources :items
    resources :reward_types
    resources :rewards
    resources :challenge_types
    resources :challenges
    resources :user_actions
    resources :locations
    resources :places
  end

  scope :api do
    get "api/select_player/:player_id", to: 'home#select_player'
    get "api/create_player"
    get "api/check_player_name"
    get "api/delete_player"
    get "api/select_player"
    get "api/get_player"
    get "api/update_player_destination"
    get "api/get_player_location"
  end

  resources :players do
    get "select_player/:player_id", to: 'home#select_player'
    get "check_player_name"
    get "select_player"
    get "get_player_location"
  end

  devise_for :users
  devise_scope :user do
    get '/sign-in' => "devise/sessions#new", :as => :login
  end

  resources :players do
    member do
      get 'start_travel'
      get 'finish_travel'
    end
  end

  resources :challenges do
    member do
      get 'get_by_level'
    end
  end

  get "home/index"

  get "places/:external_id", to: "places#show"

  # attempting a custom route:
  # resources :places do
  #   collection do
  #     get 'show'
  #   end
  # end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller user_actions automatically):
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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all user_actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
