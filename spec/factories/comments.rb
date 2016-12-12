require 'faker'

FactoryGirl.define do
  # Create a fake comment -- will require user_id & product_id
  factory :comment do |c|
    c.content Faker::Lorem.paragraph(2)
    c.rating Faker::Number.between(1, 5)
  end
end
