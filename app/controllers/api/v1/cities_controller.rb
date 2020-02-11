# frozen_string_literal: true

# class CitiesController < ActionController::API
#     def index
#         render json: City.all.as_json
#     end
# end

module Api
  module V1
    class CitiesController < ApplicationController
      def index
        render json: City.all.order(:name).as_json
      end
    end
  end
end
