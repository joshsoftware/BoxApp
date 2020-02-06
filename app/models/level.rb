# frozen_string_literal: true

class Level < ApplicationRecord
  validates :name, presence: true
  has_many :level_city_sports
end
