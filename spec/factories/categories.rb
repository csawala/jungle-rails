require 'faker'

FactoryGirl.define do
  # Create a fake category
  factory :category do |c|
    c.name { Faker::Book.genre }
  end
end
