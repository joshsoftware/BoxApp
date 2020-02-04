require 'faker'
Faker::Config.random = Random.new(42)

FactoryBot.define do
    factory :new_user do
        name { Faker::Name.name }
        contact_number { Faker::Number.number(digits: 4)}
        role { Faker::Boolean.boolean }
    end
end 