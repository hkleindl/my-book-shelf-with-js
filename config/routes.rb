Rails.application.routes.draw do
  
  get 'genres/index'
  get 'genres/show'
  get 'authors/index'
  get 'authors/show'
  get 'books/index'
  get 'books/show'
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  resources :users, only: [:create, :show] do
    resources :books, only: [:index, :show, :new, :create]
  end
  resources :books
  resources :sessions, only: [:create]
  resources :authors, only: [:index, :show]
  resources :genres, only: [:index, :show]
  resources :ratings, only: [:new, :create]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
