ArtOfTheStreets::Application.routes.draw do
  devise_for :users

  resources :posts

  resources :sessions

  root :to => "posts#index"
end
