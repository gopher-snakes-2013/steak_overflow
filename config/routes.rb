SteakOverflow::Application.routes.draw do
  root to: 'topics#index'
  resources :sessions
  resources :topics
  resources :comments, only: [:show, :new, :create]
  resources :users, only: [:show, :new, :create]
end
