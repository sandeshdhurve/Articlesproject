require 'rails_helper'

RSpec.describe ArticlesPublisher, :type => :model do
 
  let(:articles_publisher){FactoryGirl.create(:articles_publisher)}
  
  it "should have valid article_publisher" do
    expect(articles_publisher.valid?).to be true
  end

  describe 'validation' do
   it "should have valid article" do
     invalid_articles_publisher=articles_publisher
     invalid_articles_publisher.article=nil
     expect(invalid_articles_publisher.valid?).to be false
     expect(invalid_articles_publisher.errors).to have_key(:article)
   end

   it "should have valid publisher" do
     invalid_articles_publisher=articles_publisher
     invalid_articles_publisher.publisher=nil
     expect(invalid_articles_publisher.valid?).to be false
     expect(invalid_articles_publisher.errors).to have_key(:publisher)
   end
 end

  describe 'association' do
    it { should belong_to(:article) }
    it { should belong_to(:publisher) }
  end
end
