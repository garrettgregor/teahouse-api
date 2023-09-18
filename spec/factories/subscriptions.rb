FactoryBot.define do
  factory :subscription do
    title { Faker::Name.first_name}
    price { Faker::Name.last_name}
    status { Faker::Number.between(from: 0, to: 1)}
    frequency { Faker::Number.between(from: 1, to: 120)}
  end
end