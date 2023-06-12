Rails.application.routes.draw do
  resources :champs, only: [:index, :show, :create, :update, :destroy]
  # other routes for your Rails app
end