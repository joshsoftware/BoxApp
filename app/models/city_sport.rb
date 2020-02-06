class CitySport < ApplicationRecord
  validates :number_of_boxes, :number_of_players, presence: true

  belongs_to :city
  belongs_to :sport
  has_many :user_city_sports
end
