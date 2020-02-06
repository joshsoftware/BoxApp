# frozen_string_literal: true

module Api
  module V1
    class CitySportsController < ApplicationController
      def displaysports
        @token = JsonWebToken.decode(params["token"])
        @user_id = @token["user_id"]
        @user = User.where(id: @user_id)
        @city_id = @user.first.city_id
        @sport_list = []
        @city_sports = CitySport.where(city_id: @city_id)
        @city_sports.find_each do |citysport|
          @sport_list += Sport.where(id: citysport.sport_id)
        end
        render json: @sport_list.as_json
      end
    end
  end
end
