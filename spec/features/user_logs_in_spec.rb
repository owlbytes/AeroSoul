require "spec_helper"

describe "user logs in" do 

  let!(:user) do
    User.create(email: "nehita@nehita.com", 
                password: "password", 
                confirmed_at: Time.now)
  end

  it "lets the user log in" do 
    visit root_path
    expect(page).to have_link("Log In")

    click_link("Log In")

    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)

    click_button("Sign In")

    expect(page).to have_content(I18n.t("devise.sessions.signed_in"))

  end
end 