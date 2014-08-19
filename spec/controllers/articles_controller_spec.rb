require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do

	let(:article){FactoryGirl.create(:article)}

	describe "GET index" do
    it "assigns @articles" do
      get :index, {:user_id=>article.user.id}
      expect(assigns(:articles)).to eq([article])
    end

    it "renders the index template" do
      get :index, {:user_id=>article.user.id}
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
   it "shows article" do
     get :show, {:id => article.id,:user_id=>article.user.id}
      expect(assigns(:article)).to eq(article)
    end

    it "renders the show template" do
      get :show, {:id => article.id,:user_id=>article.user.id}
      expect(response).to render_template("show")
    end
  end

  describe "GET create" do
   	it "should create a valid instance" do
      @article= FactoryGirl.create(:article)
      expect(@article).to be_an_instance_of Article
    end  

    it "should render to user home" do
      @article= FactoryGirl.create(:article)
      debugger
      expect(response).to redirect_to("/users/#{@article.user.id}")
    end


  end




end
