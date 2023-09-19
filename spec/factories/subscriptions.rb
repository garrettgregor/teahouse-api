FactoryBot.define do
  factory :subscription do
    title { Faker::Subscription.plan }
    price { Faker::Number.between(from: 0.0, to: 100.0) }
    status { Faker::Number.between(from: 0, to: 1) }
    frequency { Faker::Number.between(from: 1, to: 120) }
  end
end
