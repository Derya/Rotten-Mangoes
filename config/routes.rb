Rails.application.routes.draw do

  get '/movies/search', to: 'movies#search'
  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:new, :create, :show]
  resource :sessions, only: [:new, :create, :destroy]
  root to: 'movies#index'
  namespace 'admin' do
    resources :users
    resource :shadow_sessions, only: [:new, :create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
