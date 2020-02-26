# frozen_string_literal: true

module Api
  module V1
    class LevelSportsController < ApplicationController
      # skip_before_action :validate_token, only: [:create]
      def create
        city_id = @current_user.city_id
        sport_id = params["sport_id"]
        level_id = params["level_id"]
        city_sport = CitySport.find_by(city_id: city_id, sport_id: sport_id)
        level_city_sports = LevelCitySport.where(city_sport_id: city_sport.id, level_id: level_id)
        if city_sport.nil? || level_city_sports.empty?
          return render json: {"message": I18n.t("user_city_sports.create.id_not_found")}, status: 422
        end

        user_city_sport = UserCitySport.new(user_id: @current_user.id,
          city_sport_id: city_sport.id, level_city_sports_id: level_city_sports.ids[0])
        if user_city_sport.save
          render json: {"message": I18n.t("user_city_sports.create.created_sucessfully")}, status: 201
        else
          render json: {"message": I18n.t("user_city_sports.create.create_failed")}, status: 422
        end
      end
    end
  end
end
