require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@mail.com" }
    password '1234secret'
    password_confirmation '1234secret'
    system_admin false
    type nil

    trait :admin do
      system_admin true
    end

    trait :ally do
      system_admin false
      type "Ally"
    end

    trait :organization do
      system_admin false
      type "Organization"
    end
  end
end
