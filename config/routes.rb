Rails.application.routes.draw do
  resources :rides
  resources :attractions
  resources :users

  root "rides#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
