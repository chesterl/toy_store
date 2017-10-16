FactoryGirl.define do
  factory :seller do
    name         { Faker::Name.name }
    street       { "120 Sussex St" }
    state        { "NSW" }
    suburb       { "Sydney" }
    postcode     { "2000" }
    country      { "Australia" }
  end
end
