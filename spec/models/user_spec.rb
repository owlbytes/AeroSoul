require 'spec_helper'

describe User do

  it "should not be valid without an email" do
    user = User.new

    expect(user).not_to be_valid

  end 

end

  