FactoryBot.define do
  factory :tea do
    title { Faker::Name.first_name}
    description { Faker::Lorem.last_name}
    temperature { Faker::Number.between(from: 170, to: 212)}
    brew_time { Faker::Number.between(from: 150, to: 300)}
  end
end