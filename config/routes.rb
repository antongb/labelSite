Rails.application.routes.draw do

  root 'backbone#index'

  resources :emails, only: [:create]

end
