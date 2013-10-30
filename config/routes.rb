SteakOverflow::Application.routes.draw do

  resources :topics, only: [:index, :new, :create]

end
