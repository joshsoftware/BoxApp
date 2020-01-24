class CitySport < ApplicationRecord
  belongs_to :city
  belongs_to :sport
  has_many :user_city_sports
end
