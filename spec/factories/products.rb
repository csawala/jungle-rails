require 'faker'

FactoryGirl.define do
  # Create a fake product -- will require category
  factory :product do |p|
    p.name Faker::Book.title
    p.description Faker::Lorem.paragraph(2)
    p.image Faker::Avatar.image
    p.price_cents Faker::Number.number(6)
    p.quantity Faker::Number.number(2)
  end
end
