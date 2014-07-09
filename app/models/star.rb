class Star < ActiveRecord::Base
  attr_accessible :user, :post, :post_id
  belongs_to :user
  belongs_to :post

end