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

  delete '/remove', to: 'places#destroy'
  delete '/remove_all', to: 'places#destroy_all'
  post '/add', to: 'places#add'
  get '/search', to: 'searches#index'
end
