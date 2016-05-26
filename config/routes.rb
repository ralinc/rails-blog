Rails.application.routes.draw do
  root to: 'homes#show'
  resource :about, only: [:show]
end

