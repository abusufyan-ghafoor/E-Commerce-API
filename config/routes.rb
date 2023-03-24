Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :products
      resources :categories
      resources :product_details
    end
  end
end
