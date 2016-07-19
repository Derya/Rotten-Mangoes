Rails.application.routes.draw do

  get '/movies/search', to: 'movies#search'
  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'movies#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
