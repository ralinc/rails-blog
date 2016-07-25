Rails.application.routes.draw do
  root to: 'home#show'

  resources :articles

  get 'about', to: 'about#show'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
