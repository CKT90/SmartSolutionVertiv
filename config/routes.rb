Rails.application.routes.draw do

  
  namespace :admin do
    root :to => redirect('/admin/configs')

    resources :users
    resources :configs
   
  end


  
  root               'static_pages#home'
  get   'login'   => 'sessions#new'
  get   'help'    => 'static_pages#help'
  get   "configure"  => "configs#new", :as => "configure"
  post  "configure"  => "configs#create"
  get   "configlist" => "configs#index"
  get   "signup"  => "users#new", :as => "signup"
  post  "signup"  => "users#create"
  post  'login'   => 'sessions#create'
  delete'logout'  => 'sessions#destroy'
  get   'rack1'   => 'static_pages#rack1'
  get   'rack2'   => 'static_pages#rack2'
  get   'rack3'   => 'static_pages#rack3'
  get   'rack4'   => 'static_pages#rack4'
  get   'rack5'   => 'static_pages#rack5'
  get   'rack6'   => 'static_pages#rack6'

  resources :configs, only: [:new, :create, :show]
  resources :users, only: [:edit, :update]
  resources :password_resets, only: [:new, :create, :edit, :update]

  get "*path" => redirect("/") #redirect invalid url

end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
 
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

