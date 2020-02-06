require 'rails_helper'

describe "post a question route", :type => :request do
    
    before do
        FactoryBot.create(:user)
        Sport.create(name: "Badminton")
        City.create(name: "Pune")
        CitySport.create(city_id: 1, sport_id: 1, number_of_boxes: 5,number_of_players: 10)
        Level.create(name: "B1")

        post '/api/v1/level_sports', params: {:token => "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSJ9.O5Y5s_hvEW8BM7E8jq6HihxQ0DDFxO_2_xtnrvVj4PY",:sport_id => "1",:level_name => "B1"}
    end

    it 'returns a ok status' do
        expect(response).to have_http_status(:ok)
    end
end                 