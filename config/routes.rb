Rails.application.routes.draw do
  
  namespace :admin do
    root to: "restaurants#index"
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
