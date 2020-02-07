class Sport < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :city_sports
end
