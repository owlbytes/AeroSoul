require 'spec_helper'

describe Post do
  it  {should validate_presence_of(:title)}
  it {should validate_presence_of(:description)}

  describe "#record_vote_of_user" do
    it "records the user's vote" do
      @post= FactoryGirl.create(:post)
      @user= FactoryGirl.create(:user)
      @post.record_vote_of_user(@user, 1)
      @post.reputation_for(:votes).should == 1

    end

    it "raises an error when passed a vote other than 1 or -1"

    it "changes the user's vote if they've already voted"


  end
end




