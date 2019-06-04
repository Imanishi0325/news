Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root "top#index"
  resources :top, only: [:index, :new, :create, :destroy]
  resources :users, only: [:show]
end