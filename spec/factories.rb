require 'faker'
Faker::Config.random = Random.new(42)

FactoryBot.define do
    factory :user do
        name { Faker::Name.name }
        contact_number { Faker::Number.number(digits: 4)}
        role { Faker::Boolean.boolean }
        city_id { Faker::Number.between(from: 1, to:2)}
    end
end 