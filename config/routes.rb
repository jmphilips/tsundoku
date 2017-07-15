Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'books#index'

  get 'find', to: 'pages#find'
  post 'search', to: 'pages#search'

  resources :books
  resources :requests, only: [:index, :create, :show, :destroy]
  get 'my_books', to: 'books#my_books'
end
