require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  
   before (:each) do
     @user = FactoryGirl.create(:user)
     sign_in @user
   end

    describe "GET index" do
    
    it "assigns @users" do
      get :index
      expect(assigns(:users).first).to eq(@user)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
   
    it "assigns @user" do
     get :show, {:id => @user.id}
      expect(assigns(:user)).to eq(@user)
    end

    it "renders the show template" do
      get :show, {:id => @user.id}
      expect(response).to render_template("show")
    end
  end




end