# Here we set the OmniAuth logger to the Rails logger 
# add OmniAuth to the Rack middleware, setting the provider to Facebook 
# passing in the App Id and App Secret through environment variables.


OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET_KEY']
end
 