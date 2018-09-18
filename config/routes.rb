Rails.application.routes.draw do
  
  root 'sessions#new'
  get '/signup', to: 'users#new'
  resources :users, only: [:create, :show] do
    resources :books, only: [:index, :new, :create, :show]
  end
  resources :books
  resources :sessions, only: [:create]
  get '/authors/most_books', to: 'authors#most_books'

  resources :authors, only: [:index, :show]
  resources :genres, only: [:index, :show]
  resources :ratings, only: [:new, :create, :edit, :update, :destroy]
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
