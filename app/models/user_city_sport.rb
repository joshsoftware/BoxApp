class UserCitySport < ApplicationRecord
  belongs_to :city_sport
  belongs_to :user
  belongs_to :level_city_sport
end
