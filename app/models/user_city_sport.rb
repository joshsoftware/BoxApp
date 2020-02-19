# frozen_string_literal: true

class UserCitySport < ApplicationRecord
  belongs_to :city_sport
  belongs_to :user
  has_and_belongs_to_many :level_city_sport
end
