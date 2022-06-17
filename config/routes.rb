Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  resources :comments, only: [:create, :destroy]
end
