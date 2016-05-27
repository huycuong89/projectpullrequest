Rails.application.routes.draw do
  root to: 'pullrequests#index'

  resources :pullrequests
end
