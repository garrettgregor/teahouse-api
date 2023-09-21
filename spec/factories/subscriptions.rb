FactoryBot.define do
  factory :subscription do
    title { Faker::Subscription.plan }
    price { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
    status { Faker::Number.between(from: 0, to: 1) }
    frequency { Faker::Number.between(from: 0, to: 3) }
  end
end
