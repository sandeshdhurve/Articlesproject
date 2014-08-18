require 'rails_helper'

RSpec.describe User, :type => :model do
  
  let(:user){FactoryGirl.create(:user)}
  it "should have valid user" do
   expect(user.valid?).to be true
  end

  describe 'validation' do
    
   it "should have valid name" do
     invalid_user=user
     invalid_user.name = ''
     expect(invalid_user.valid?).to be false
     expect(invalid_user.errors).to have_key(:name)
     
     invalid_user.name = nil
     expect(invalid_user.valid?).to be false
     expect(invalid_user.errors).to have_key(:name)
    end

    it "should have valid email" do
      invalid_user=user
      invalid_user.email=''
      expect(invalid_user.valid?).to be false
      expect(invalid_user.errors).to have_key(:email)
   
      invalid_user=user
      invalid_user.email=nil
      expect(invalid_user.valid?).to be false
      expect(invalid_user.errors).to have_key(:email)
    end
  end


  describe 'association' do
   it {should have_many(:articles) }
  end
end
