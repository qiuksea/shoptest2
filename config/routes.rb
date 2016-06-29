Rails.application.routes.draw do
  resources :orders
  #get 'store/index'
  #root to: 'visitors#index'
  root to:'store#index'
  get '/store/:id', to: 'store#show', as: 'store'
  resources :carts, only: [:show, :destroy]
  resources :line_items, only: [:create, :update, :destroy]

  devise_for :users
  resources :users

  namespace :admin do
    resources :products
  end
end
