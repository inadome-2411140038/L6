Rails.application.routes.draw do
  resources :products

  root 'top#main'
  get 'top/main'

  resources :cartitems, only: [:new, :create, :destroy]
  resources :carts, only: [:show]

  get "up" => "rails/health#show", as: :rails_health_check
end