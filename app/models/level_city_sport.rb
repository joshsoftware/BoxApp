# frozen_string_literal: true

class LevelCitySport < ApplicationRecord
  belongs_to :level
  belongs_to :city_sport
  has_and_belongs_to_many :user_city_sports
end
