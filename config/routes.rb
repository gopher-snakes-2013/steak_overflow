SteakOverflow::Application.routes.draw do
  root to: 'topics#index'
  resources :sessions
  resources :topics do
    resources :comments, only: [:show, :new, :create]
  end
  resources :users, only: [:show, :new, :create]
end
