require "spec_helper"

describe "user edits a post" do 

 # creating a fake user
  let!(:user) do
    User.create(email: "dan@apple.com", 
                password: "password", 
                role: "user",
                confirmed_at: Time.now)
  end

  let!(:post) do 
    Post.create(title: "Title",
                artist: "Dan Von Trapp",
                address: "386 Mountain Ave, Ridgewood NJ 07450 USA",
                medium: "spray paint",
                description: "Dan Von Trapp creates a work of art ",
                tag_list: "Dan, Test, Siri", 
                photo: File.open(Rails.root.join("spec", "fixtures", "images", "fresh.jpg"))
      )
  end 

  before do 
    post.user = user 
    #need to save post to database after creating
    post.save 
    visit new_user_session_path

    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)

    click_button("Sign In")
  end


  it "lets the user edit post" do 
    visit(edit_post_path(post))
    fill_in("Artist", with: "Nehita de Jersey")

    click_button("Update Post")

    expect(page).to have_content("Post was successfully updated!")
  end

end 