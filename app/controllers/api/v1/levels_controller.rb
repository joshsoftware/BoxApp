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
        slots_query = "#{city_sport.number_of_players} - (SELECT COUNT(*) FROM user_city_sports WHERE ",
                      "user_city_sports.level_city_sports_id = level_city_sports.id) as free_slots"
        attribute = "levels.id as id",
                    "levels.name as name",
                    "levels.description as description",
                    slots_query[0] + slots_query[1]
        level_list = LevelCitySport.select(attribute[0], attribute[1], attribute[2], attribute[3])
                                   .joins(:level).where(city_sport_id: city_sport.id).uniq
        render json: level_list.as_json
      end
    end
  end
end
