module Api
  module V1
    class LevelsController < ApplicationController
  
      def index
        render json: Level.all.as_json
      end
  
    end
  end
end
  