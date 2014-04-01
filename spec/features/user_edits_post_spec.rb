require "spec_helper"

describe "user edits a post" do 

 # creating a fake user
  let!(:user) do
    User.create(email: "nehita@nehita.com", 
                password: "password", 
                confirmed_at: Time.now)
  end


  # logging in the user and creating a fake post
  before do 
    visit new_user_session_path

    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)

    click_button("Sign In")

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

    click_button("Create Post")

    expect(page).to have_content("Post was successfully created!")
  end


  it "lets the user edit post" do 
    # visit(post_path)
    visit(edit_post_path(post))

    # visit "/posts/1"

    # click_link("edit")

    fill_in("Artist", with: "Nehita de Jersey")

    click_button("Update Post")

    expect(page).to have_content("Post was successfully updated!")
  end

end 