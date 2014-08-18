FactoryGirl.define do
factory :user  do
  	name Faker::Name.name
  	email {Faker::Internet.email }
    encrypted_password Faker::Internet.password   
  end

  factory :article do
    user
    name Faker::Name.name
    content {Faker::Lorem.paragraph}
  end

  factory :articles_publisher do
   article
   association :publisher, factory: :user
  end
end