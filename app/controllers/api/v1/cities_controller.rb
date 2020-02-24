# frozen_string_literal: true

module Api
  module V1
    class CitiesController < ApplicationController
      skip_before_action :validate_token, only: [:index]

      def index
        render json: City.all.order(:name).as_json
      end
    end
  end
end
