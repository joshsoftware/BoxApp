# frozen_string_literal: true

require "faker"
Faker::Config.random = Random.new(42)

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    contact_number { Faker::Number.number(digits: 4) }
    is_admin { Faker::Boolean.boolean }
    city_id { Faker::Number.between(from: 1, to: 1) }
  end
end
