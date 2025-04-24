Rails.application.routes.draw do
  get "home/index"
  get 'classement', to: 'rankings#index', as: :ranking
  root to: 'home#index'
  resources :teams do
    resources :players, only: [:new, :create]
  end
  resources :players, only: [:index, :show, :edit, :update, :destroy]
  resources :matches
end
