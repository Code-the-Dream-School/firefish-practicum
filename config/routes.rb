Rails.application.routes.draw do
  resources :cities
  devise_for :users

  root "home#index"

  get '/search', to: 'searches#index'
  post '/add', to: 'searches#add_to_favorites'
end
