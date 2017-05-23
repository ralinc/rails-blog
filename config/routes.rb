Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}

  resources :articles
  resources :tags, only: [:show]

  get 'healthcheck', to: 'health_checks#status'
  get 'fullcheck', to: 'health_checks#complete'
end
