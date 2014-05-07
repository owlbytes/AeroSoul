
module LoginHelper

  def login_with(email, password)
    visit new_user_session_path

    fill_in("Email", with: email)
    fill_in("Password", with: password)

    click_button("Log In")

  end 



end 