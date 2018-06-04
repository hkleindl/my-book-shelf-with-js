Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  resources :users, only: [:create, :show]
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
