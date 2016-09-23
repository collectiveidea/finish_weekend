require 'spec_helper'

describe SessionsController do
  context "create session" do
    context "existing user" do
      before(:each) do
        @user = FactoryGirl.create(:user)
      end

      context "happy path authentication" do
        before(:each) do
          post :create, user: { username: "testuser", password: "password" }
        end

        it "should redirect to the management route" do
          response.should redirect_to(manage_path)
        end

        it "should set the session correctly" do
          session[:user].should == { valid: true }
        end
      end

      context "incorrect password" do
        before(:each) do
          post :create, user: { username: "testuser", password: "bad" }
        end

        it "should redirect back to the login page" do
          response.should redirect_to(new_sessions_path)
        end

        it "should not set the session" do
          session.include?(:user).should == false
        end
      end
      
    end  
    
    context "no existing users" do
      before(:each) do
        post :create, user: { username: "bad", password: "bad" }
      end

      it "should redirect back to the login page" do
        response.should redirect_to(new_sessions_path)
      end

      it "should not set the session" do
        session.include?(:user).should == false
      end
    end
  end

  context "destroying a session" do
    context "existing session" do
      before(:each) do
        session[:user] = { valid: true }
        delete :destroy
      end

      it "should destroy the session" do
        session.include?(:user).should == false
      end

      it "should redirect to the home page" do
        response.should redirect_to(root_path)
      end
    end
    context "no existing session" do
      before(:each) do
        delete :destroy
      end

      it "should destroy the session" do
        session.include?(:user).should == false
      end

      it "should redirect to the home page" do
        response.should redirect_to(root_path)
      end
    end
  end
end
