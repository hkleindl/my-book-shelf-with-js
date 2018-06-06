Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  resources :users, only: [:create, :show] do
    resources :books, only: [:index, :show]
  end
  resources :books
  resources :sessions, only: [:create]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
