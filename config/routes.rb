Rails.application.routes.draw do
  #get 'store/index'
  #root to: 'visitors#index'
  root to:'store#index'
  devise_for :users
  resources :users
end
