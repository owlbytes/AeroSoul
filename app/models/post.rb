class Post < ActiveRecord::Base
  attr_accessible :title, :description, :photo, :remote_image_url
  mount_uploader :photo, ImageUploader
end