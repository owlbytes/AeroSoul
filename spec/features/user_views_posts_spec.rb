require "spec_helper"


describe "user views posts index" do 
  let!(:user) { FactoryGirl.create(:user) }
  let!(:posts) { FactoryGirl.create_list(:post, 2) }

  it "lets the user view the posts index" do 
    visit root_path 
    click_link("Curate")

    expect(page).to have_content(posts[0].title, posts[1].title)
  end 
end 

