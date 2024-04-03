Rails.application.routes.draw do
  devise_for :users
  get '/dashboard', to: 'users#dashboard', as: :dashboard

  root "home#index"
end
