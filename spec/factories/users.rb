require 'faker'

FactoryGirl.define do
  # Create a fake user
  factory :user do |u|
    u.first_name Faker::Name.first_name
    u.last_name Faker::Name.last_name
    u.email Faker::Internet.email
    u.password_digest Faker::Internet.password
    u.admin false
  end
end
