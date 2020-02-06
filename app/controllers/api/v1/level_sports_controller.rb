# frozen_string_literal: true

module Api
  module V1
    class LevelSportsController < ApplicationController
      def create
        @token = JsonWebToken.decode(params["token"])
        @user_id = @token["user_id"]
        @user = User.find(@user_id)
        @city_id = @user.city_id
        @sport_id = params["sport_id"]
        @city_sport_id = CitySport.find_by(city_id: @city_id, sport_id: @sport_id)
        @level_id = params["level_id"]
        @level_city_sports = LevelCitySport.where(city_sport_id: @city_sport_id.id,
                                                  level_id:      @level_id)
        UserCitySport.create(user_id:              @user_id,
                             city_sport_id:        @city_sport_id.id,
                             level_city_sports_id: @level_city_sports.ids[0])
        render json: {status: "ok"}
      end
    end
  end
end
