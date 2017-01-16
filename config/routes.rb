Rails.application.routes.draw do
  resources :articles
  resources :tags, only: [:show]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
