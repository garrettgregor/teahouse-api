FactoryBot.define do
  factory :subscription do
    title { Faker::Subscription.plan }
    price { Faker::Name.last_name }
    status { Faker::Number.between(from: 0.0, to: 100.0) }
    frequency { Faker::Number.between(from: 1, to: 120) }
  end
end