# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, :last_name, :contact_number, :email, presence: true
  validates :contact_number, uniqueness: true, length: {is: 10}
  validates :email,
            uniqueness: true,
            format:     {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "invalid format"}

  has_and_belongs_to_many :matches
  has_many :user_city_sports
  belongs_to :city
  validates_associated :matches, :user_city_sports

  before_save :titleize_names

  def titleize_names
    self.first_name = first_name.titleize
    self.last_name = last_name.titleize
  end


  def self.getOpponents(current_user_id)
    user_id = current_user_id
    all_opponents=[]
    
        user_city_sport = UserCitySport.find_by(user_id: user_id)
        if user_city_sport.nil?
          return  all_opponents
        else
          user_level_city_sports_id = user_city_sport.level_city_sports_id
          user_city_sport_id = user_city_sport.city_sport_id
         
          # fetches all opponents of particular city, sport for a user
          all_opponents = UserCitySport.where(
            city_sport_id: user_city_sport_id, level_city_sports_id: user_level_city_sports_id
          ).where.not(user_id: user_id).joins(:user).select("users.id,users.first_name,users.last_name,users.contact_number")
         return all_opponents
       end
  end

end


