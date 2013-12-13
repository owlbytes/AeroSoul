class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      sign_in_and_redirect( user, :event => :authentication)
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end


  def google_oauth2
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted? 
      flash.notice = "Signed in through google"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      flash.notice = "Problem creating account"
      redirect_to new_user_registration_url
    end
  end 

  # each strategy needs its own method with the same name

end