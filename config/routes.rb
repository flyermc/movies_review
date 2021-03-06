Rails.application.routes.draw do

  resources :movies, :users, :reviews, :posts

  root to: "main#index", as: :index

  post 'search', to: "search#search"
  get 'search/clear', to: "search#clear"
  get 'search/year/:year', to: "search#by_year"
  get 'movie/sorting/:id', to: "search#movie_sort"


  get 'login', to: "login#index", as: :login
  post 'login', to: "login#attempt_login"

  get 'logout', to: "logout#index", as: :logout

  match 'movies/:id', to: "movies#show", via: [:get, :post]

  controller :comments do
    get 'movies/:movie_id/comments', to: "comments#show", as: :comments
    post 'movies/:movie_id/comments', to: "comments#create"
  end

  controller :post_comments do
    get 'posts/:post_id/comments', to: "post_comments#show", as: :post_comments
    post 'posts/:post_id/comments', to: "post_comments#create"
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
