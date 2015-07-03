Rails.application.routes.draw do

  root 'backbone#index'

  resources :emails, only: [:create]

  # resources :fitness

  get ':action' => 'static#:action'

end
