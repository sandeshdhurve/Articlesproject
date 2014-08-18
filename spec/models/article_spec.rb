require 'rails_helper'

RSpec.describe Article, :type => :model do

  let(:article){FactoryGirl.create(:article)}

  it "should have valid Article" do
    expect(article.valid?).to be true
  end

  describe 'validations' do

    it "should have valid name" do
      invalid_article=article
      invalid_article.name=""
      expect(invalid_article.valid?).to be false
      expect(invalid_article.errors).to have_key(:name)
    
      invalid_article.name=nil
      expect(invalid_article.valid?).to be false
      expect(invalid_article.errors).to have_key(:name)
    end

    it "should have valid content" do
      invalid_article=article
      invalid_article.content=""
      expect(invalid_article.valid?).to be false
      expect(invalid_article.errors).to have_key(:content)
  
      invalid_article.content=nil
      expect(invalid_article.valid?).to be false
      expect(invalid_article.errors).to have_key(:content)
    end
  end

  describe 'association' do
    it { should belong_to(:user) }   
  end
end
