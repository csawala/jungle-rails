require 'faker'

FactoryGirl.define do
  # Create a fake user
  fake_password = Faker::Internet.password(8)

  factory :user do |u|
    u.first_name Faker::Name.first_name
    u.last_name Faker::Name.last_name
    u.email Faker::Internet.email
    u.password fake_password
    u.password_confirmation fake_password
    u.admin false
  end
end
