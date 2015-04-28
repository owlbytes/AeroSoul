ArtOfTheStreets::Application.routes.draw do

  devise_for :users, controllers: {:omniauth_callbacks => "omniauth_callbacks"}

  devise_scope :user do
    resources :users, only: :index do
      resources :stars, only: :index
      member do
        get :my_posts
      end
    end
  end

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    #devise routes information
    resources :users

    # get '/users/auth/facebook/callback', to: "omniauth_callbacks#facebook"

    #routes for posts
    resources :posts do 
      resources :stars, only: [:create, :destroy]
      member do
        post :vote
      end
    end

    
    resources :searches 
    resources :about
    resources :terms
    resources :admin


    #sets routes for tags(via acts_as_taggable) and google maps
    get 'tags/:tag', to: 'posts#index', as: :tag
    get '/discover', to: 'maps#index', as: :maps
    
    #sets the homepage to be the carousel 
    root :to => "slideshow#index"

  end
  match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
  match '', to: redirect("/#{I18n.default_locale}")
end
