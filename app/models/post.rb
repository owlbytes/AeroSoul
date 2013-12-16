class Post < ActiveRecord::Base
  #validation
  validates :title, presence: true
  validates :description, presence: true

  attr_accessible :title, :description, :photo, :remote_image_url
  mount_uploader :photo, ImageUploader

  #relationships
  belongs_to :user
  has_many :scores
  has_many :stars

  #voting
  def deserialize(post)
    @post = post
    upvoters = @post.upvoters[1..-2].split(',').collect! {|n| n.to_i}
    downvoters = @post.downvoters[1..-2].split(',').collect! {|n| n.to_i}
    return upvoters, downvoters
  end

  
end