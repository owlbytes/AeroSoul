ArtOfTheStreets::Application.routes.draw do
  devise_for :users

  resources :posts
  resources :searches
  root :to => "posts#index"
end
