class Post < ActiveRecord::Base
  attr_accessible :title, :description, :photo, :remote_image_url, :tag_list, :artist, :commision, :medium, :address
  mount_uploader :photo, ImageUploader


#validation
  validates :title, presence: true
  validates :description, presence: true

#voting
  has_reputation :votes, source: :user, aggregated_by: :sum

#stuff for geocoding
  geocoded_by :address
  after_validation :geocode

#for tagging!
  acts_as_taggable

#for infinite scroll
  self.per_page = 6

#relationships
  belongs_to :user
  has_many :scores
  has_many :stars

  def record_vote_of_user(user, score)
    add_or_update_evaluation(:votes, score, user)
  end

end