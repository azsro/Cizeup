Rails.application.routes.draw do

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'pages#Home'
  
  # Pages Routing 
  
  get 'pages/Home' => 'pages#Home'

  get 'pages/Login' => 'pages#Login'

  get 'pages/Explore' => 'pages#Explore'

  get 'pages/About' => 'pages#About'
  
  get 'pages/Help' => 'pages#Help'
  
  get 'pages/Contact' => 'pages#Contact'
  
  get 'pages/Books' => 'pages#Books'
  
  get 'pages/ShortStories' => 'pages#ShortStories'
  
  get 'pages/Poetry' => 'pages#Poetry'
  
  get 'pages/Screenplays' => 'pages#Screenplays'
    
  get 'pages/Theater' => 'pages#Theater'
  
  get 'pages/Other' => 'pages#Other'
  
  # User Routing
  
  get 'signup' => 'users#new'
  
  get 'show' => 'users#show'
  
  get 'update' => 'users#edit'
  
  get 'index' => 'users#index'
  
  get 'create' => 'microposts#new'
  
  # Sessions Routing 
  
  get 'sessions/new'
  
  get    'login'   => 'pages#Login'
  
  post   'login'   => 'sessions#create'
  
  delete 'logout'  => 'sessions#destroy'
  
  # Other Routing 
  
  get 'password_resets/new'

  get 'password_resets/edit'
  
  
  
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
