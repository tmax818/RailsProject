Rails.application.routes.draw do

  root  'static#home'
  get   'sessions/create'
  get   'sessions/destroy'

  get     'about',      to: 'static#about'
  get     'help',       to: 'static#help'
  get     'signup',     to: 'users#new'
  post    'signup',     to: 'users#create'
  get     'login',      to: 'sessions#new'
  post    'login',      to: 'sessions#create'
  delete  'logout',     to: 'sessions#destroy'

  resources :genres
  resources :reviews
  resources :books
  resources :users


end
