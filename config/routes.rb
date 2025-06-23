
Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :todos, only: [:create, :update, :destroy]
end

