# frozen_string_literal: true

module Api
  module V1
    class CitiesController < ApplicationController
      skip_before_action :validate_token, only: %i[index create]
      def index
        render json: City.all.as_json
      end
    end
  end
end
