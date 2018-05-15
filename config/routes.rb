Rails.application.routes.draw do

  root 'static#home'
  get 'about',       to: 'static#about'
  get 'help',       to: 'static#help'
  get 'signup',     to: 'users#new'
  post 'signup',    to: 'users#create'


  resources :genres
  resources :reviews
  resources :books
  resources :users


end
