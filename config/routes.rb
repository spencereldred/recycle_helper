Recycle::Application.routes.draw do

  root :to => 'hi5exchanges#index'

  get '/hi5exchanges/descriptions' =>'hi5exchanges#descriptions'
  resources :hi5exchanges

  resources :profiles

  resources :transactions

  get '/suppliers/profile' => 'suppliers#profile'

  post '/suppliers/create_profile' => 'suppliers#create_profile'
  get '/suppliers/profile' => 'suppliers#profile'

  resources :suppliers

  post '/helpers/create_profile' => 'helpers#create_profile'
  get '/helpers/profile' => 'helpers#profile'
  resources :helpers
  #get '/helpers' => 'helpers#index'

  #get '/suppliers' => 'suppliers#index'

  get '/recyclers/history/:id' => 'recyclers#history', as: :recycler_history
  resources :recyclers

  get 'redeemers/history/:id' => 'redeemers#history', as: :redeemer_history
  resources :redeemers

  resources :recycler_redeemers

  resources :users
  resources :sessions

  get '/logout' => "sessions#destroy"
  get '/login' => "sessions#new"


end
