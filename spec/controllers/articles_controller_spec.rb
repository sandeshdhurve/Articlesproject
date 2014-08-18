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

   describe "GET delete" do
   	get :delete, {:id => article.id,:user_id=>article.user.id}
   	


end
