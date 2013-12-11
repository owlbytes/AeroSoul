class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable, :omniauthable, :confirm_within => 10.minute


  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :photo, :remote_image_url, :password, :password_confirmation, :remember_me
  mount_uploader :photo, ImageUploader
end 