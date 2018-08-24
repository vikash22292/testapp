require 'spec_helper'
# require "rails_helper"

describe Contact do
  it "has a valid factory" do
    Factory.create(:todo_list).should be_valid
  end

  it "is invalid without a title" do
    Factory.build(:todo_list, title: nil).should_not be_valid
  end

  it "is should be valid a title" do
    Factory.build(:todo_list, title: "demo").should be_valid
  end

  it "it should have default status as active" do
    user = Factory(:user)
    todo_list = Factory(:todo_list, user: user)
    todo_list.status.should == 'active'
  end
end
