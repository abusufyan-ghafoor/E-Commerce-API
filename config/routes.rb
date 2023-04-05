Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :categories
      resources :product_details
      resources :users
      resources :products do
        resources :comments
      end
    end
  end
end
