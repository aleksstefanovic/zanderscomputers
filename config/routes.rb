Rails.application.routes.draw do
  root 'main#index'
  get 'main/index'

  resources :items

  devise_for :users
end
