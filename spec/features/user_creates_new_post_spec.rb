require "spec_helper"

describe "user creates new post" do  

  # creating a fake user
  let!(:user) do
    User.create(email: "nehita@nehita.com", 
                password: "password", 
                confirmed_at: Time.now)
  end


  # logging in the user so they can make a new post
  before do 
    login_with(user.email, user.password)
  end

  # testing whether you can make a new post
  it "lets the user create a new post" do 
    visit root_path

    click_link("New Post")

    fill_in("Title", with: "Title")
    fill_in("Artist", with: "Dan von Trapp")
    fill_in("Commissioned?", with: "No")
    fill_in("Address", with: "386 Mountain Ave, Ridgewood, NJ 07450, USA")
    fill_in("Medium", with: "Spray Paint")
    fill_in("Description", with: "Dan Von Trapp creates a work of art")
    fill_in("Tags", with: "Dan, Test, Siri")

    attach_file("Photo", Rails.root.join("spec", "fixtures", "images", "fresh.jpg"))
    #creating a platform agnostic file path

    click_button("Create Post")

    expect(page).to have_content("Post was successfully created!")
  end
  

end