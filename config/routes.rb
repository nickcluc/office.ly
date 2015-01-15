Rails.application.routes.draw do
  root 'homes#index'

  devise_for :users


  resources :listings, only: [
    :new,
    :index,
    :create,
    :show,
    :edit,
    :update,
    :destroy
  ]
  resources :listings, only: [:show] do
    resources :reviews, only: [:new, :create, :index]
    resources :reservations, only: [:new, :create, :index]
  end

  resources :reservations, only: [:show]
end
