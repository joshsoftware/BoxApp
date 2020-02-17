# frozen_string_literal: true

FactoryBot.define do
  factory :sport do
    name { Faker::Name.name }
  end
end
