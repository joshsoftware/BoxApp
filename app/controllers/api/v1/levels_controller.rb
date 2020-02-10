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
        level_list = []
        level_city_sports = LevelCitySport.where(city_sport_id: city_sport.id)
        level_city_sports.find_each do |level|
          level_obj = Level.find_by(id: level.level_id)
          number_of_players = UserCitySport.where(level_city_sports_id: level.id).count
          level_hash = {"name"        => level_obj.name,
                        "description" => level_obj.description,
                        "count"       => city_sport.number_of_players - number_of_players}
          level_list.append(level_hash)
        end
        render json: level_list.as_json
      end
    end
  end
end
