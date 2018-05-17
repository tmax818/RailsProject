Rails.application.routes.draw do

  root  'static#home'

  get     'about',      to: 'static#about'
  get     'help',       to: 'static#help'
  get     'signup',     to: 'users#new'
  post    'signup',     to: 'users#create'
  get     'login',      to: 'sessions#new'
  post    'login',      to: 'sessions#create'
  delete  'logout',     to: 'sessions#destroy'

  resources :genres
  resources :reviews
  resources :books, only: [:new, :show]

  resources :users do
    resources :books, only: [:index]
    resources :reviews, only: [:new, :create]

  end


end
