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

  resources :posts do 
    member do
      put :vote
      put :assign_favorite_post
    end
  end

  get 'tags/:tag', to: 'posts#index', as: :tag
  
  resources :searches
  
  root :to => "slideshow#index"
end
