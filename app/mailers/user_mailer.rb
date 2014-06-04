class UserMailer < ActionMailer::Base
  default from: "aerosoul@aerosoul.me"

  def registration_confirmation user
    @user = user
    mail to: user.email, subject: "Welcome to AeroSoul"
  end

end