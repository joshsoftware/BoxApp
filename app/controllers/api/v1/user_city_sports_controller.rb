# frozen_string_literal: true

module Api
  module V1
    class UserCitySportsController < ApplicationController
      def index
        user_city_sport = UserCitySport.find_by(user_id: @current_user.id)
        if user_city_sport
          user_city_sport_hash = {id:                   user_city_sport.id,
                                  city_sport_id:        user_city_sport.city_sport_id,
                                  level_city_sports_id: user_city_sport.level_city_sports_id,
                                  message:              "Registered for a sport"}
          render json: user_city_sport_hash, status: :ok
        else
          render json: {error: "Not registered for a sport"}, status: :not_found
        end
      end
    end
  end
end
