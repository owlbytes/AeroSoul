class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :timeoutable, :omniauthable, :confirm_within => 10.minute


  # Setup accessible (or protected) attributes for your model
  
  validates :email, presence: true, uniqueness: true
  attr_accessible :first_name, :last_name, :role, :email, :photo, :remote_image_url, :password, :password_confirmation, :remember_me, :confirmed_at
  mount_uploader :photo, ImageUploader

  def role?(r)
    self.role == r.to_s 
  end

end 