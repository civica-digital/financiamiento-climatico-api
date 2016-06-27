require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@mail.com" }
    password '1234secret'
    password_confirmation '1234secret'
    system_admin false

    trait :admin do
      system_admin true
    end
  end
end
