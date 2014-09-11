Rails.application.routes.draw do
  resources :athletes, only: [:index, :create, :update, :delete]
end
