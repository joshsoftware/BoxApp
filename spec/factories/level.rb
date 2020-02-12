# frozen_string_literal: true

FactoryBot.define do
  factory :level do
    name { Faker::Name.name }
    description { Faker::Name.name }
  end
end
