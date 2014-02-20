ArtOfTheStreets::Application.routes.draw do
  
  #devise routes information
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

#calback url from twitter
match ‘/auth/:provider/callback’ => ‘users#twitter_login’

  #routes for posts
  resources :posts do 
    member do
      put :vote
      put :assign_favorite_post
    end
  end

  #routes for search via textacular (all hail Aaron Patterson)
  resources :searches 

  # # #route for find
  # get "/finds(", to: "finds#index", as: :tag

  #sets routes for tags(via acts_as_taggable) and google maps
  get 'tags/:tag', to: 'posts#index', as: :tag
  get '/discover', to: 'maps#index', as: :maps
  
  #sets the homepage to be the carousel 
  root :to => "slideshow#index"
end
