require 'spec_helper'

describe Relationship do
  
  before(:each) do
    @follower = Factory(:user)
    @followed = Factory(:user, :email => Factory.next(:email))
    
    @attr = {:followed_id => @followed.id }
  end
  
  it "should create a new instance with valid attributes" do
    @follower.relationships.create!(@attr)
  end
  
  describe "follow methods" do
    
    before(:each) do
      @relationship = @follower.relatinoships.create!(@attr)
    end
    
    it "should have a follower attribute" do
      @relationship.should respond_to(:follower)
    end
    
    it "should have the right follower" do
      @relationship.follower.should == @follower
    end
    
    it "should have a followed attribute" do
      @relationship.should respond_to(:followed)
    end
    
    it "should have the right followed user" do
      @relationship.followed.should == @followed
    end
  end
  
  describe "validations" do
    it "should require a follower id" do
      Relationship.new(@attr).should_not be_valid
    end
    
    it "should require a followed id" do
      @follower.relationships.build.should_not be_valid
    end
    
    it "should have a reverse_relationships method" do
      @user.should respond_to(:reverse_relationships)
    end
    
    it "should have a followers method" do
      @user.should respond to(:followers)
    end
    
    it "should include the follower in the followers array" do
      @user.follow!(@followed)
      @followed.followers.should include(@user)
    end
  end
  
end
