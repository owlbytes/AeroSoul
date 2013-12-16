class Score < ActiveRecord::Base

  attr_accessible :score

  belongs_to :user
  belongs_to :post

end