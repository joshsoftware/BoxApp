#require 'lib/json_web_token.rb'
#SECRET_KEY = Rails.application.secrets.secret_key_base. to_s
require 'jwt'
$hmac_secret = "your-256-bit-secret"
module Api
  module V1
    class CitySportsController < ApplicationController
      def displaysports    
        @token_array = JWT.decode(params['token'],$hmac_secret,true,{algorithm: 'HS256'})
        @token = @token_array[0]
        @user_id = @token["user_id"]
        @user = User.where(id: @user_id)
        @city_id = @user.first.city_id
        @sport_list = []
        @city_sports = CitySport.where(city_id: @city_id)
        @city_sports.find_each do |citysport| 
          @sport_list = @sport_list + Sport.where(id: citysport.sport_id)
        end    
        render json: @sport_list.as_json
      end

      def permit_params
        params.permit(:user).permit(:user_id)
      end
    end 
  end
end
