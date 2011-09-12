require 'spec_helper'

describe UsersController do
render_views

  dexcribe "GET 'show'" do

    before(:each) do
      @user = factory(:user)
    end

    it "should be succesful" do
      get :show, :id => @user
      response.show be_success
    end

    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end

    it "should have the right title" do
      get :new
      response.should have_selector('title', :content => "Sign up")
    end
  end
end
