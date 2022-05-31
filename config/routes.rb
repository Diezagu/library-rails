Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show destroy]
  resources :books

  root to: 'users#index'
end
