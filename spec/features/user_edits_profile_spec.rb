require "spec_helper"

describe "user edit profile" do 

  let!(:user) do
    User.create(email: "nehita@nehita.com", 
                password: "password", 
                confirmed_at: Time.now)
  end


  before do 
    visit new_user_session_path

    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)

    click_button("Sign In")
  end

  it "lets the user edit profile" do 

    click_link "Profile"

    fill_in("Email", with: "dan.vontrapp@apple.com")
    fill_in("Current password", with: user.password)
    click_button("Update")

    expect(page).to have_content(I18n.t("devise.registrations.update_needs_confirmation"))

    user.reload
    user.confirm!

    visit(current_path)
    expect(page).to have_content("dan.vontrapp@apple.com")
  end

end 
 
 