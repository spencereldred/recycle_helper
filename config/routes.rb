Recycle::Application.routes.draw do

  root :to => 'recyclers#index'

  resources :collectors
  resources :recyclers
  resources :collector_recyclers

end
