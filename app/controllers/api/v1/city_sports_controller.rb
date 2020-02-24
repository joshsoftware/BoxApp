# frozen_string_literal: true

module Api
  module V1
    class CitySportsController < ApplicationController
      def displaysports
        city_id = @current_user.city_id
        sport_list = []
        city_sports = CitySport.where(city_id: city_id)
        render json: {"error": I18n.t(city_sports.id_not_found)}, status: 422 if city_sports.nil?
        city_sports.find_each do |citysport|
          sport_list += Sport.where(id: citysport.sport_id)
        end
        render json: {"error": I18n.t(city_sports.sport_list_empty)}, status: 422 if sport_list.empty?
        render json: sport_list.as_json
      end
    end
  end
end
