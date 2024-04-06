Rails.application.routes.draw do
  resources :cities
  devise_for :users
  get '/dashboard', to: 'users#dashboard', as: :dashboard

  root "home#index"
end
