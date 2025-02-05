Rails.application.routes.draw do
  resources :rides
  resources :attractions
  resources :users

  root "welcome#index"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/signout", to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
