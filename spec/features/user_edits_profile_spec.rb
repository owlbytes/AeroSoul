require "spec_helper"

describe "user edit profile" do 

 let!(:user) { FactoryGirl.create(:user) }
 
  before do 
    login_with(user.email, user.password)
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
 
 