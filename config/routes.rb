Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  resources :users, only: %i[index show destroy]
  resources :books

  root to: 'users#index'
end
