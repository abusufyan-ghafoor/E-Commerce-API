Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :categories
      resources :product_details
      resources :users
      resources :orders
      resources :order_details
      resources :products do
        resources :comments
      end
    end
  end
end
