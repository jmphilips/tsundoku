Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'books#index'

  get 'find', to: 'pages#find'
  post 'search', to: 'pages#search'

  get 'matches/listed', to: 'pages#giver_match'
  get 'matches/requested', to: 'pages#taker_match'
  get 'matches', to: 'pages#matches'

  resources :books
  resources :requests, only: [:index, :create, :show, :destroy]
  get 'my_books', to: 'books#my_books'
end
