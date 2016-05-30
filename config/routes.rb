Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks:'callbacks' ,sessions: 'users/sessions'}
  root to: 'pullrequests#index'
  resources :pullrequests
end
