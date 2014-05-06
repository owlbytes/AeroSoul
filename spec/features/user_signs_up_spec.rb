require "spec_helper"

  describe "user signs up" do 
    it "lets the user sign up" do
      visit root_path 
      expect(page).to have_link("Sign Up")

      click_link("Sign Up")

      fill_in("First name", with: "Dan")
      fill_in("Last name", with: "Von Trapp")
      fill_in("Email", with: "dan@google.com")
      fill_in("Password", with: "let me in please")
      fill_in("Password confirmation", with: "let me in please")

      click_button("Sign Up")

      expect(page).to have_content(I18n.t("devise.registrations.signed_up_but_unconfirmed"))
    end 
  end
 