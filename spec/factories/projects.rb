require 'factory_girl'

FactoryGirl.define do
  factory :project do
    area "Area 1"
    year Date.today.year
    sequence(:name) { |n| "Proyecto #{n}" }
    quantity 1000
    currency "USD"
    financing "Financing text"
    region "Region"
    grant "Grant"
    source "Source"
    status "En implementación"
    observations "Observaciones varias..."
    association :owner, factory: :user
  end
end
