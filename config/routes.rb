SteakOverflow::Application.routes.draw do

  resources :topics, only: [:create]

end
