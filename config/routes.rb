Rails.application.routes.draw do

  get '/'                   , to: 'products#index'         , as: :root
  get '/products/:id'       , to: 'products#show'          , as: :product

  get '/admin/products'     , to: 'products#show_products' , as: :admin
  post '/admin/products' , to: 'products#create'
  get '/admin/products/new' , to: 'products#new'           , as: :new_product
  get '/admin/products/:id' , to: 'products#edit'          , as: :admin_product
  delete '/admin/products/:id' , to: 'products#destroy'
  patch '/admin/products/:id' , to: 'products#update'

  get '/cart'               , to: 'orders#index'           , as: :cart
  post '/cart'              , to: 'orders#create'
  patch '/cart/:id'         , to: 'orders#update_item'
  delete '/cart/:id'        , to: 'orders#delete_item'
  delete '/order/:id'       , to: 'orders#destroy'
  get '/checkout'           , to: 'orders#show'            , as: :checkout
  get 'orders/:id'          , to: 'orders#view'            , as: :order
  patch '/orders/:id'       , to: 'orders#update'
  get '/account'            , to: 'orders#account'         , as: :account

  get '/admin/orders'       , to: 'orders#display'         , as: :admin_order
  patch '/admin/orders/:id' , to: 'orders#update_status'

  get '/sign-in'            , to: 'users#sign_in'          , as: :sign_in
  post '/sign-in'           , to: 'users#sign_in_user'
  get '/sign-up'            , to: 'users#sign_up'          , as: :sign_up
  post '/sign-up'           , to: 'users#create'
  get '/sign-out'           , to: 'users#sign_out'         , as: :sign_out

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
