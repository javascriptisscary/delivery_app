Rails.application.routes.draw do
  #api
  namespace :api do
    namespace :v1 do
      resources :meals, only: [:index, :show, :destroy]
    end
  end
end
