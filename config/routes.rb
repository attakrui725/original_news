Rails.application.routes.draw do
  get 'genre/show'
  devise_for :users
  root to: 'articles#index'
  resources :articles, only: [:new, :index, :create, :show,:update, :destroy] do
  resources :messages, only: [:create, :new]
  end
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as:'destroy_favorite'
  resources :genres, only: :show
end
