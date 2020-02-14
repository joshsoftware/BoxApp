# frozen_string_literal: true

FactoryBot.define do
  factory :city do
    Faker::Config.locale = "en-IND"
    name { Faker::Address.city }
  end
end
