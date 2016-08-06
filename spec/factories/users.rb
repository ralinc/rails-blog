FactoryGirl.define do
  factory :user do
    name 'John Smith'
    sequence(:email) { |n| "john#{n}@example.com" }
    password 'password'
  end
end
