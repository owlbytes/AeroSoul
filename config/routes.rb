ArtOfTheStreets::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }


  resources :posts
  resources :searches
  root :to => "posts#index"
end
