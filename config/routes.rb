Rails.application.routes.draw do
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
  resources :users, only: [:show, :create, :edit, :update, :destroy]
  
  
end
