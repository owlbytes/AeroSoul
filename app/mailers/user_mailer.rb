class UserMailer < ActionMailer::Base
  default from: "SprayCan@aerosoul.me"

  def registration_confirmation(user)
    @user = user
    mail :subject => "Welcome to AeroSoul!",
    :to => "#{user.email}",
    :from => "SprayCan@aerosoul.me"
  end
end
