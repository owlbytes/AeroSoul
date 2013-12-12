class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  attr_accessible :title, :description, :photo, :remote_image_url
  mount_uploader :photo, ImageUploader
end