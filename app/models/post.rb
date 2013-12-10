class Post < ActiveRecord::Base
  attr_accessible :title, :description, :photo
end