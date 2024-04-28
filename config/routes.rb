Rails.application.routes.draw do
  resources :cities
  devise_for :users

  root "home#index"

  delete '/remove', to: 'places#destroy'
  delete '/remove_all', to: 'places#destroy_all'
  post '/add', to: 'places#add'
  get '/search', to: 'searches#index'
end
