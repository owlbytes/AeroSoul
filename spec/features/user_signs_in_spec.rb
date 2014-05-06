require "spec_helper"

  describe "user signs in" do 
    let! (:user){
      User.create(email:"dan@apple.com", password: "let me in")
    }

    before do
      user.confirm!
    end


    it "lets the user sign in" do
      visit root_path 
      expect(page).to have_link("Log In")

      click_link("Log In")


      fill_in("Email", with: user.email)
      fill_in("Password", with: user.password)

      click_button("Sign In")
      binding.pry
      expect(page).to have_content(I18n.t("devise.sessions.signed_in"))

      expect(page).to have_content(user.email)

    end 
  end
 