FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "john#{n}@example.com" }
    password 'password'
  end
end
