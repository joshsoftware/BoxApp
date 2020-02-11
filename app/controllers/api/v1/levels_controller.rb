# frozen_string_literal: true

module Api
  module V1
    class LevelsController < ApplicationController
      skip_before_action :validate_token, only: [:index]
      def index
        render json: Level.all.as_json
      end

      def all_levels
        city_id = @current_user.city_id
        sport_id = params["sport_id"]
        city_sport = CitySport.find_by(city_id: city_id, sport_id: sport_id)
        level_list = LevelCitySport.select("level_city_sports.id as id, levels.name as name, levels.description as description, #{city_sport.number_of_players} - (SELECT COUNT(*) FROM user_city_sports WHERE user_city_sports.level_city_sports_id = level_city_sports.id) as free_slots").joins(:city_sport, :level, "LEFT JOIN user_city_sports ON user_city_sports.level_city_sports_id = level_city_sports.id").where(city_sport_id: 1).uniq
        render json: level_list.as_json
      end
    end
  end
end
