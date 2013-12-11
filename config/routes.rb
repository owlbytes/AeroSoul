ArtOfTheStreets::Application.routes.draw do
  devise_for :users

  resources :posts
<<<<<<< HEAD
  resources :searches
=======

  resources :sessions

>>>>>>> chore/devise
  root :to => "posts#index"
end
