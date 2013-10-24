Recycle::Application.routes.draw do

  root :to => 'hi5exchanges#index'

  get '/hi5exchanges/descriptions' =>'hi5exchanges#descriptions'

  resources :profiles

  resources :transactions

  resources :recyclers

  get '/redeemers' => 'redeemers#index'
  put "/redeemers/:id", to: "redeemers#update"

  resources :users
  resources :sessions


  get '/logout' => "sessions#destroy"
  get '/login' => "sessions#new"


end
