Rails.application.routes.draw do

  root  'static#home'

  get     'author',      to: 'static#author'
  get     'title',       to: 'static#title'
  get     'signup',     to: 'users#new'
  post    'signup',     to: 'users#create'
  get     'login',      to: 'sessions#new'
  post    'login',      to: 'sessions#create'
  delete  'logout',     to: 'sessions#destroy'

  resources :genres
  resources :reviews
  resources :books, only: [:new, :create, :show]

  resources :users do
    resources :books, only: [:index]
    resources :reviews, only: [:new, :create]

  end


end
