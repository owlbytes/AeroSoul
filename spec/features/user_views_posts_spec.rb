require "spec_helper"

describe "user views posts index" do 
  it "lets the user view the posts index" do 
    visit root_path 
    click_link("Curate")
  end 
end 

describe "user edit post" do 


it "lets the user create a new post" do 
    visit root_path

    click_link("New Post")
        expect(page).to have_content("Post was successfully updated!")