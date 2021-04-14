Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  # resources :users, only: [:edit, :update, :index, :new, :create, :destroy, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end