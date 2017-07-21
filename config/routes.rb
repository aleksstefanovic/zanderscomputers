Rails.application.routes.draw do
    get 'main/index'

    resources :items
    resources :users

    root 'main#index'
end
