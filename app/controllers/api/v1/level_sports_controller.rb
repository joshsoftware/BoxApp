# frozen_string_literal: true

module Api
  module V1
    class LevelSportsController < ApplicationController
      # skip_before_action :validate_token, only: [:create]
      def create
        city_id = @current_user.city_id
        sport_id = params["sport_id"]
        city_sport_id = CitySport.find_by(city_id: city_id, sport_id: sport_id)
        level_id = params["level_id"]
        puts "Level id : #{level_id}"
        level_city_sports = LevelCitySport.where(city_sport_id: city_sport_id.id, level_id: level_id)
        puts {"level city sport #{level_city_sports}"}
        UserCitySport.create(user_id:              @current_user.id,
                             city_sport_id:        city_sport_id.id,
                             level_city_sports_id: level_city_sports.ids[0])
        render json: {message: "Sport and Level selected successfully"},status: 200
      end
    end
  end
end
