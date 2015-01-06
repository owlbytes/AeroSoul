CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider  => 'AWS',  # required
    :aws_access_key_id  => ENV['AWSAccessKeyId'],  # required
    :aws_secret_access_key => ENV['AWSSecretKey'],  # required
<<<<<<< HEAD
    :region  => 'eu-west-1',  # optional, defaults to 'us-east-1'
=======
    # :region  => 'eu-west-1',  # optional, defaults to 'us-east-1'
>>>>>>> bac36c02a77cc4bd3c345637301e35b08d0ef629
  }
  config.fog_directory  = ENV['AeroBucket']  # required

  config.fog_public  = true  # optional, defaults to true
end