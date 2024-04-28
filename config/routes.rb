Rails.application.routes.draw do
  get 'restaurants/show'
  get 'hotels/show'
  get 'attractions/show'
  resources :cities
  resources :attractions, only: [:show]
  resources :hotels, only: [:show]
  resources :restaurants, only: [:show]
  devise_for :users

  root "home#index"

  get '/search', to: 'searches#index'
  post '/add', to: 'places#add'
end
