Rails.application.routes.draw do
  
  namespace :admin do
    resources :restaurant_zones, only: [:index, :create, :destroy]
    root to: "restaurant_zones#index"
    get "/restaurant_zones/date/", to: "restaurant_zones#by_date"
    
  end

  root 'home#index'
  
  # login
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # api
  namespace :api do
    namespace :v1 do
      resources :meals, only: [:index, :show, :destroy]
      #scope format: true, constraints: { format: 'json' } do
        post "/login",    to: "sessions#create"
        delete "/logout", to: "sessions#destroy"
      #end
      end
    end
  
  
end
