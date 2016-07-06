Rails.application.routes.draw do

  root 'static#index'

  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete '/signout' => 'sessions#destroy'

  post "/rides/new", to: "rides#new"

 resources :attractions

 resources :users



 

end