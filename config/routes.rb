Rails.application.routes.draw do
  resources :genres
  resources :reviews
  resources :books
  resources :users, only: [:show]
  get 'signup', to: 'users#new'
  root 'static#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
