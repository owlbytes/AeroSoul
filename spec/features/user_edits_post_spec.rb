require "spec_helper"

describe "user edits a post" do 

 # creating a fake user

  let!(:user) { FactoryGirl.create(:user) }

  let!(:post) { FactoryGirl.create(:post) }
    

  before do 
    post.user = user 
    #need to save post to database after creating
    post.save 
    login_with(user.email, user.password)

  end


  it "lets the user edit post" do 
    visit(edit_post_path(post))
    fill_in("Artist", with: "Nehita de Jersey")

    click_button("Update Post")

    expect(page).to have_content("Post was successfully updated!")
  end

end 