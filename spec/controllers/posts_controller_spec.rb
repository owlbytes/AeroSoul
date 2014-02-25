require "spec_helper"

describe PostsController do 
  # creating tests to test the posts controller
  it "should pass" do
    true
  end

  it "should fail" do
    false
  end

  it "should be pending"

# creating fake data to test the index method of the posts controller
  describe "GET index" do
    before do
      @posts_fake_data = 2.times.map{Post.create(title:"trashbags", artist:"Francisco de Pejaro", commision: "no", description:"test", photo:"trash.jpg", medium: "materials", address: "1 test street, London", tag_list: "trashbag, test, recycled")}
    end

    it "should assigns @posts" do
      get :index
      expect(assigns[:users]).to eq(@users_fake_data)
    end
  end

  #tests for the GET show method

  describe "GET show" do
    before do
      @posts_fake_data = 2.times.map{Post.create(title:"trashbags", artist:"Francisco de Pejaro", commision: "no", description:"test", photo:"trash.jpg", medium: "materials", address: "1 test street, London", tag_list: "trashbag, test, recycled")}
    end

    it "assigns @post" do
      get :show, {id: @posts_fake_data.id}
      expect(assigns[:post]).to eq(@posts_fake_data)
    end
  end 


end
   