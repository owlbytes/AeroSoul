class UserMailer < ActionMailer::Base
<<<<<<< HEAD
  default from: "neha@aerosoul.me"

  def registration_confirmation user
    @user = user
    mail to:user.email, subject: "Confirmation: AeroSoul Registration" 
  end
    
=======
  default from: "aerosoul@aerosoul.me"

  def registration_confirmation user
    @user = user
    mail to: user.email, subject: "Welcome to AeroSoul"
  end
>>>>>>> dev

end