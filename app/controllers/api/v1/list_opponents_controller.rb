# frozen_string_literal: true

module Api
  module V1
    class ListOpponentsController < ApplicationController
      def opponents
        user_id = @current_user.id
        user_city_sport = UserCitySport.find_by(user_id: user_id)
        user_level_city_sports_id = user_city_sport.level_city_sports_id
        user_city_sport_id = user_city_sport.city_sport_id
        all_opponents = UserCitySport.where(
          city_sport_id:        user_city_sport_id,
          level_city_sports_id: user_level_city_sports_id
        )
        opponents = []
        all_opponents.find_each do |x|
          id = x.user_id
          if id != user_id
            opponents += User.select(
              :id,
              :first_name,
              :last_name,
              :contact_number
            ).where(id: id)
          end
        end


        puts "Opponents #{opponents}"
        opponent_count = opponents.size

        if opponent_count < 4
          render json: {count: opponent_count}
        else
          render json: opponents.as_json
        end
      end
    end
  end
end
