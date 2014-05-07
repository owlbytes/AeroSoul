ArtOfTheStreets::Application.routes.draw do
  
  #devise routes information
  devise_for :users, controllers: {:omniauth_callbacks => "omniauth_callbacks"}

  devise_scope :user do
    resources :users, :only => [:index] do
      member do
        get :my_posts
        get :starred
      end
    end
  end

  # get '/users/auth/facebook/callback', to: "omniauth_callbacks#facebook"

  #routes for posts
  resources :posts do 
    member do
      post :vote
      put :star
    end
  end


  #routes for search via textacular (all hail Aaron Patterson)
  resources :searches 

  #mumbojo
  resources :about
  resources :terms


  #sets routes for tags(via acts_as_taggable) and google maps
  get 'tags/:tag', to: 'posts#index', as: :tag
  get '/discover', to: 'maps#index', as: :maps
  
  #sets the homepage to be the carousel 
  root :to => "slideshow#index"
end
