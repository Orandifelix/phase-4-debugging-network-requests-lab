Rails.application.routes.draw do
  #Added  the destroy  route
  resources :toys, only: [:index, :create, :update, :destroy]
end
