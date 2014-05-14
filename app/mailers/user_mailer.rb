class UserMailer < ActionMailer::Base
  default from: "neha@aerosoul.me"

  def registration_confirmation user
    @user = user
    mail to:user.email, subject: "Confirmation: AeroSoul Registration" 
  end
    

end