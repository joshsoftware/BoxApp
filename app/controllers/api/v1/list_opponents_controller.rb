# frozen_string_literal: true

module Api
  module V1
    class ListOpponentsController < ApplicationController
      def opponents
        user_id = @current_user.id
        user_city_sport = UserCitySport.find_by(user_id: user_id)
        return render json: {"error": I18n.t("list_opponents.id_not_found")} if user_city_sport.nil?

        user_level_city_sports_id = user_city_sport.level_city_sports_id
        user_city_sport_id = user_city_sport.city_sport_id

        # fetches all opponents of particular city, sport for a user
        all_opponents = UserCitySport.where(
          city_sport_id: user_city_sport_id, level_city_sports_id: user_level_city_sports_id
        ).where.not(user_id: user_id).joins(:user).select("users.id,users.first_name,users.last_name,users.contact_number")
        return render json: {"error": I18n.t("list_opponents.opponents_not_found")} if all_opponents.nil?

        render json: all_opponents.as_json, status: 200
      end
    end
  end
end
