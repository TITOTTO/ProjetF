Rails.application.routes.draw do
  resources :orders, only: [:new, :create]
  resources :comments, only: [:create, :destroy, :update]
  resources :articles
  resources :user do
    resources :carts, only: [:index, :create, :destroy]
    resources :avatars, only: [:create, :destroy]
  end
  devise_for :users
  root to: "articles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
