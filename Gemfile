source 'https://rubygems.org'

gem 'rails', '3.2.14'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem "haml-rails"
gem "carrierwave", :git => "https://github.com/carrierwaveuploader/carrierwave.git"
gem "textacular", "~> 3.0"
gem "devise"
gem 'rmagick', '2.14.0', :require =>"RMagick"
gem "omniauth"
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'cancan'
gem 'omniauth-google-oauth2'
gem 'omniauth-facebook'
gem "acts-as-taggable-on"
gem "geocoder"
gem 'will_paginate', '~> 3.0'
gem "fog", "~> 1.29.0"
gem 'activerecord-reputation-system', require: 'reputation_system'
gem 'dotenv-rails', :groups => [:development, :test]
gem 'simple_form'

group :production do
  gem 'puma'
  gem 'rails_12factor'
end


group :development do
  gem 'erb2haml'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'quiet_assets'
end 

group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'pry-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem "capybara"
  gem 'selenium-webdriver'
  gem "launchy"
end 


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
