Rails.application.routes.draw do
  resources :athletes, only: [:index, :create, :update, :destroy]
end
