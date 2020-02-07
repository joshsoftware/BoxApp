class Level < ApplicationRecord
  validates :name, :description, presence: true  
  validates :name, uniqueness: true   
  has_many :level_city_sports
end
