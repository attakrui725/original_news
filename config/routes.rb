Rails.application.routes.draw do
devise_for :users, controllers: {
  omniauth_callbacks: 'users/omniauth_callbacks',
  registrations: 'users/registrations'
}

  devise_scope :user do
  post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'articles#index'
  resources :articles, only: [:new, :index, :create, :show,:update, :destroy] do
  resources :messages, only: [:create, :new]
  collection do
        get 'search'
    end
  end
  resources :relationships, only: [:create, :destroy]

  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as:'destroy_favorite'
  resources :genres, only: :show
  resources :users do
    get :followings, on: :member
    get :followers, on: :member

  end

end
