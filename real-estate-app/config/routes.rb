Rails.application.routes.draw do
  # get 'homepage/index'
  root 'homepage#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:create, :show, :update]
  resources :houses
  resources :messages
  resources :offers, only: [:create, :show, :update, :destroy]
  resources :watchlists
  resources :watchli

end
