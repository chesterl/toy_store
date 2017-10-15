FactoryGirl.define do
  factory :toy do
    name         { Faker::Lorem.sentence }
    price        { 5.00 }
    description { Faker::Lorem.paragraph(4) }
  end
end
