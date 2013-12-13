ArtOfTheStreets::Application.routes.draw do
  devise_for :users, controllers: {:omniauth_callbacks => "omniauth_callbacks"}

  # get '/users/auth/facebook/callback', to: "omniauth_callbacks#facebook"


  resources :posts
  resources :searches
  
  root :to => "slideshow#index"
end
