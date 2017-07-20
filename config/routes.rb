Rails.application.routes.draw do
    get 'main/index'

    resources :items

    root 'main#index'
end
