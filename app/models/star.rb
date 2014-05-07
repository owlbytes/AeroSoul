class Star < ActiveRecord::Base
  attr_accessible :user, :post
  belongs_to :user
  belongs_to :post

end