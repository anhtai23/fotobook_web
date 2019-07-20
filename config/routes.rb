Rails.application.routes.draw do

  root 'home#index'
  get 'users/:id/following', to: 'users#following' ,as: :following
  get 'users/:id/unfollowers', to: 'users#followers',as: :followers

  devise_for :users
  resources :users, only: [:show, :edit, :update] do
      resources :albums, only: [:new, :create, :show, :destroy]
  end
  resources :posts, only: [:new, :create, :show, :destroy] do
    resources :likes
    resources :comments
  end
  resources :follows, only: [:create, :destroy]
  resources :photos, only: [:new, :create, :show, :destroy]
  get 'search' => 'search#index'
end
