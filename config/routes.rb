Rails.application.routes.draw do
  resources :memberships, only: [:new, :create, :destroy]
  resources :games
  resources :users
  get 'home', to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  root "pages#home"
end
