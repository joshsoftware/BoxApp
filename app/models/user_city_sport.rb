class UserCitySport < ApplicationRecord
  belongs_to :city_sport
  belongs_to :user
end
