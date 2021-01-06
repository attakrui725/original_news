Rails.application.routes.draw do
  get 'genre/show'
  devise_for :users
  root to: 'articles#index'
  resources :articles, only: [:new, :index, :create, :show,:update, :destroy] do
  resources :messages, only: [:create, :new]
  resource :favorites, only: [:create, :destroy]
  end
  resources :genres, only: :show
end
