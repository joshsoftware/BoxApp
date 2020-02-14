# frozen_string_literal: true

module Api
  module V1
    class CitiesController < ApplicationController
      def index
        render json: City.all.order(:name).as_json
      end
    end
  end
end
