class Sport < ApplicationRecord
  validates :name, presence: true
  has_many :city_sports
end
