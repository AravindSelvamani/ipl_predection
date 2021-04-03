Rails.application.routes.draw do
  resources :increase_points
  resources :match_predections
  resources :users
  get 'scorecard/index'
  root 'match_predections#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/scorecard', to: 'scorecard#index'
end
