class City < ApplicationRecord
  validates :name, presence: true

  has_many :city_sports
  validates_associated :city_sports
end
