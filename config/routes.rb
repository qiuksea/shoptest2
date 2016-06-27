Rails.application.routes.draw do
  #get 'store/index'
  #root to: 'visitors#index'
  root to:'store#index'
  resources :carts, only: [:show]
  resources :line_items, only: [:create, :update, :destroy]

  devise_for :users
  resources :users

  namespace :admin do
    resources :products
  end
end
