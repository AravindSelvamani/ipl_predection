Rails.application.routes.draw do
  resources :increase_points
  resources :match_predections
  # resources :users
  get '/users', to:'users#index'
  root 'match_predections#index'
  # get '/increase_points/new', to:'increase_points#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
