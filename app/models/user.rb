class User < ApplicationRecord
  has_and_belongs_to_many :matches
  has_many :user_city_sports
end
