# frozen_string_literal: true

class City < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :city_sports
  validates_associated :city_sports
end
