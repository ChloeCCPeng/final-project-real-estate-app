Rails.application.routes.draw do
  get 'watchlists/index'
  get 'watchlists/create'
  get 'watchlists/show'
  get 'watchlists/update'
  get 'watchlists/destroy'
  get 'offers/create'
  get 'offers/show'
  get 'offers/update'
  get 'offers/destroy'
  get 'messages/index'
  get 'messages/create'
  get 'messages/show'
  get 'messages/update'
  get 'messages/destroy'
  get 'houses/index'
  get 'houses/create'
  get 'houses/show'
  get 'houses/update'
  get 'houses/destroy'
  get 'users/create'
  get 'users/show'
  get 'users/update'
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
end
