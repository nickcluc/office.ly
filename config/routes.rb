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
end
