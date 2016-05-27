Rails.application.routes.draw do
  root to: 'pullrequests#index'
  get 'login', to: 'users#login'
  post 'login', to: 'users#createsession'
  resources :pullrequests

  resources :users do

  end
end
