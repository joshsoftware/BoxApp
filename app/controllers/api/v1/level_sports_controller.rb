require 'jwt'
$hmac_secret = "your-256-bit-secret"
module Api
  module V1
    class LevelSportsController < ApplicationController
      def create
        @token_array = JWT.decode(params['token'],$hmac_secret,true,{algorithm: 'HS256'})
        @token = @token_array[0]
        @user_id = @token["user_id"]
        @user = User.where(id: @user_id)
        @city_id = @user.first.city_id
        @sport_id = params["sport_id"]
        @city_sport_id = CitySport.find_by(city_id: @city_id, sport_id: @sport_id)
        @level_name = params["level_name"]
        @level_id = Level.find_by(name: @level_name)
        @level_city_sports_id = LevelCitySport.where(city_sport_id: @city_sport_id, level_id: @level_id)
        UserCitySport.create!(user_id: @user_id, city_sport_id: @city_sport_id.id,level_city_sports_id: @level_city_sports_id)
        render json: {status: "ok"}
      end
    end
  end
end