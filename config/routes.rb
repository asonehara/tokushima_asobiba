Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'categories/index'
  get 'categories/show'
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, only: [:show], shallow: true do
    resources :spots
  end
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :edit, :update, :destroy] do
    member do
      get :spots
    end
  end
  
  resources :likes, only:[:create, :destroy]
  resources :comments, only:[:create, :destroy]
  
  
end
