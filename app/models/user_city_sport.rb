class UserCitySport < ApplicationRecord
  belongs_to :city_sport
  belongs_to :user
  has_many :level_city_sport
end
