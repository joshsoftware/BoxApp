class LevelCitySport < ApplicationRecord
  belongs_to :level
  belongs_to :city_sport
  has_many :user_city_sports
end
