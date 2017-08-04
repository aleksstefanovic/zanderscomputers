Rails.application.routes.draw do
  root 'main#index'
  get 'main/index'
  delete 'carts/all' => 'carts#all'

  resources :items
  resources :builds
  resources :carts
  devise_for :users
end
