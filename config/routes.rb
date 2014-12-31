Rails.application.routes.draw do
  root 'homes#index'

  devise_for :users

  resources :listings, only: [:new, :create, :show]
end
