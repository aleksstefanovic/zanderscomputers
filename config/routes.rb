Rails.application.routes.draw do
  root 'main#index'
  get 'main/index'

  resources :items
  resources :builds
  resources :carts
  devise_for :users
end
