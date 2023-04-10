Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :categories
      resources :product_details
      resources :users
      resources :orders
      resources :products do
        post '/comments', to: 'comments#product_comment', defaults: { commentable_type: 'OrderDetail' }
      end
    
      # resources :order_details
    end
  end
end
