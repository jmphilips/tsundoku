Rails.application.routes.draw do
  root 'pages#home'

  get 'find', to: 'pages#find'
  post 'search', to: 'pages#search'

  resources :books
end
