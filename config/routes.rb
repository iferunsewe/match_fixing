Rails.application.routes.draw do
  resources :specialities
  resources :stats
  resources :leagues
  devise_for :players, controllers: {
    sessions: 'players/sessions',
    omniauth_callbacks: "players/omniauth_callbacks",
    registrations: "registrations"
  }
  # as :player do
  #   get "/login" => 'about#index'
  # end
  resources :matches
  resources :grounds
  resources :teams
  resources :players
  resources :ratings
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'about#index'
  # root 'leagues#show', :id => '1'

  resources :players do
    collection { post :search, to: 'players#search' }
  end

  resources :teams do
    collection { post :search, to: 'teams#search' }
  end


  resources :leagues do
    collection { post :search, to: 'leagues#search' }
  end

  get '/search', to: "search#index"

  get '/leagues/:id/fixtures-and-results', to: 'leagues#fixtures_and_results'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

end
