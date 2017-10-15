FactoryGirl.define do
  factory :user do
    name                 { Faker::Name.first_name }
    sequence(:email)     {|n| "#{n}+#{Faker::Internet.safe_email}" }
    password             "password"
  end
end
