Recycle::Application.routes.draw do

  root :to => 'recyclers#index'

  resources :recyclers
  resources :redeemers
  resources :recycler_redeemers

end
