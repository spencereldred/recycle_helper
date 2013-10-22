Recycle::Application.routes.draw do

  root :to => 'hi5exchanges#index'
  get '/recyclers/history/:id' => 'recyclers#history', as: :recycler_history
  resources :recyclers

  get 'redeemers/history/:id' => 'redeemers#history', as: :redeemer_history
  resources :redeemers

  resources :recycler_redeemers

  resources :hi5exchanges

  resources :users
  resources :sessions

  get '/logout' => "sessions#destroy"
  get '/login' => "sessions#new"


end
