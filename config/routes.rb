Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index,:show] do
    resources :reviews, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "tweets#index"
  resources :relationships, only: [:create, :destroy]
  get "home" => "tweets#index"
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy, :update]
  end
  resources :posts, :only => [:index, :new, :create]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
end
