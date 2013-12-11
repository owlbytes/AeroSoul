ArtOfTheStreets::Application.routes.draw do
  resources :users
  resources :posts

  root :to => "posts#index"
end
