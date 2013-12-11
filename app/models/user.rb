class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :photo, :remote_image_url
  mount_uploader :photo, ImageUploader
end 