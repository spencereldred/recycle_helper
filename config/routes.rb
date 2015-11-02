Recycle::Application.routes.draw do

  root :to => 'hi5exchanges#index'

  # get '/hi5exchanges/descriptions' =>'hi5exchanges#descriptions'
  resources :transactions
  # get "/transactions/new", to: "transactions#new", as: "new_transaction"
  # post "/transactions", to: "transactions#create"
  # put "/transactions/:id", to: "transactions#update"
  # resources :transactions

  resources :redeemers
  # get '/redeemers' => 'redeemers#index'
  # put "/redeemers/:id", to: "redeemers#update"

  resources :users
  resources :sessions

  get '/logout' => "sessions#destroy"
  get '/login' => "sessions#new"

  # resources :admins
  get '/admins' => 'admins#index'

  resources :groups

 # root :to => 'samples#index'
 #  get "/samples", to: "samples#index"
 #  get "/samples/new", to: "samples#new", as: "new_sample"
 #  get "/samples/:id", to: "samples#show", as: "sample"
 #  get "/samples/:id/edit", to: "samples#edit", as: "edit_sample"
 #  post "/samples", to: "samples#create"
 #  put "/samples/:id", to: "samples#update"
 #  delete "/samples/:id", to: "samples#destroy"

end
