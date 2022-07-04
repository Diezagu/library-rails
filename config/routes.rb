Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  resources :users, only: %i[index show destroy] do
    resources :comments, module: 'users'
  end
  resources :books do
    resources :comments, module: 'books'
  end
  resources :likes, only: %i[create destroy]
  root to: 'users#index'
end
