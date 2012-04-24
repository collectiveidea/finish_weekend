require 'spec_helper'

describe User do
  it "should create a valid user object" do
    user = FactoryGirl.build(:user)
    user.save.should be_true
  end

  context "username" do
    it "should be required" do
      user = FactoryGirl.build(:user, :username => nil)
      user.save.should be_false
    end

    it "should not be blank" do
      user = FactoryGirl.build(:user, :username => "")
      user.save.should be_false
    end

    it "should not allow a duplicate" do
      FactoryGirl.create(:user, :username => "duplicate").save
      user = FactoryGirl.build(:user, :username => "duplicate")
      user.save.should be_false 
    end
  end

  context "email" do
    it "should be required" do
      user = FactoryGirl.build(:user, :email => nil)
      user.save.should be_false
    end

    it "should not be blank" do
      user = FactoryGirl.build(:user, :email => "")
      user.save.should be_false
    end
  end

  context "passwords" do
    it "password should be present on create" do
      user = FactoryGirl.build(:user, :password => nil)
      user.save.should be_false
    end

    it "confirm_password should be present on create" do
      user = FactoryGirl.build(:user, :confirm_password => nil)
      user.save.should be_false
    end

    it "passwords should match" do
      user = FactoryGirl.build(:user, :password => "one", :confirm_password => "two")
      user.save.should be_false
    end
  end

  context "#authenticate" do
    before(:each) do
      @user = FactoryGirl.create(:user)
    end
    it "should authenticate an existing user" do
      User.authenticate("testuser","password").should eq @user
    end

    it "should not authenticate an existing user with an incorrect password" do
      User.authenticate("testuser", "bad").should be_nil
    end

    it "should not authenticate an nonexisting user" do
      User.authenticate("baduser","").should be_nil
    end
  end
end
