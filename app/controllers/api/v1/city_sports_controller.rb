module Api
    module V1
        class CitySportsController < ApplicationController
            def index
                #@user_id = params['user_id']
                @user = User.where(id: 1)
                @city_id = @user.first.city_id
                @sport_list = []
                @city_sports = CitySport.where(city_id: @city_id)
                @city_sports.find_each do |citysport| 
                    @sport_list = @sport_list + Sport.where(id: citysport.sport_id)
                end    
                render json: @sport_list.as_json
            end


            def displaysports
                @user_id = params['user_id']
                @user = User.where(id: 1)
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
