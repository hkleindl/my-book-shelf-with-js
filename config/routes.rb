Rails.application.routes.draw do
  
  get 'genres/index'
  get 'genres/show'
  get 'authors/index'
  get 'authors/show'
  get 'books/index'
  get 'books/show'
  root 'static_pages#log_in'
  get '/signup', to: 'users#new'
  resources :users, only: [:create, :show] do
    resources :books, only: [:new, :create]
  end
  resources :books
  resources :sessions, only: [:create]
  delete '/logout', to: 'sessions#destroy'


  get '/auth/github/callback', to: 'sessions#create'

  resources :authors, only: [:index, :show]
  resources :genres, only: [:index, :show]
  resources :ratings, only: [:new, :create, :edit, :update, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
