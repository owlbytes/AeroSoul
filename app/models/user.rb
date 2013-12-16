class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :timeoutable, :omniauthable, :omniauth_providers => [:google_oauth2, :facebook], :confirm_within => 10.minute


  # Setup accessible (or protected) attributes for your model
  validates :email, presence: true, uniqueness: true
  attr_accessible :first_name, :last_name, :role, :email, :photo, :remote_image_url, :password, :password_confirmation, :remember_me, :confirmed_at
  mount_uploader :photo, ImageUploader

  #relationships
  has_many :scores
  has_many :stars
  has_many :posts

  #voting
  def destring(user)
    fav_posts = user.fav_posts[1..-2].split(',').collect! {|n| n.to_i}
    return fav_posts
  end


  #omniauth stuff 
  def role?(r)
    self.role == r.to_s 
  end

  def self.from_omniauth(auth) 
    if user = User.find_by_email(auth.info.email) 
      user.provider = auth.provider 
      user.uid = auth.uid user 
    else 
      where(auth.slice(:provider, :uid)).first_or_create do |user| 
        user.provider = auth.provider 
        user.uid = auth.uid 
        user.email = auth.info.email 
        user.password = Devise.friendly_token[0,20] 
        user.skip_confirmation! 
      end 
    end
    user
  end


end 