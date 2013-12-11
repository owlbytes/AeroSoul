ArtOfTheStreets::Application.routes.draw do
  resources :users
  resources :posts
  resources :searches
  root :to => "posts#index"
end
