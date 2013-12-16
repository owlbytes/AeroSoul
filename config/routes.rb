ArtOfTheStreets::Application.routes.draw do
  devise_for :users, controllers: {:omniauth_callbacks => "omniauth_callbacks"}

  devise_scope :user do
    resources :users, :only => [:index] do
      member do
        get :my_posts
        get :favourites
      end
    end
  end

  # get '/users/auth/facebook/callback', to: "omniauth_callbacks#facebook"


  resources :posts
  resources :searches
  
  root :to => "slideshow#index"
end
