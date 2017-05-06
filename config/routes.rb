Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :articles
  resources :tags, only: [:show]

  get 'status', to: 'health_check#status'
end
