require "spec_helper"

describe "user destroys a post" do 
  let!(:user) { FactoryGirl.create(:user) }
  let!(:post) { FactoryGirl.create(:post) }

  before do 
    post.user = user
    post.save
    login_with(user.email, user.password)
  end

  it "lets the user destroy a post" do 
    visit post_path(post)
    click_link("delete")
    expect(page).to have_content("Post was destroyed!")
  end 
end