Rails.application.routes.draw do
  get "sessions/new"
  post 'sessions', to: 'sessions#create', as: :sessions
  get "home/index"
  get 'classement', to: 'rankings#index', as: :ranking
  root to: 'home#index'
  resource :session, only: [:new, :create, :destroy]
  delete 'logout', to: 'sessions#destroy', as: :logout
  resources :teams do
    resources :players, only: [:new, :create]
  end
  resources :players, only: [:index, :show, :edit, :update, :destroy]
  resources :matches
end
