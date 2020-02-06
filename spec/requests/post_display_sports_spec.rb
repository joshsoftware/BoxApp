require 'rails_helper'

describe "post a token and display sports", :type => :request do

    before do
        FactoryBot.create(:user)
        Sport.create(name: "Badminton")
        City.create(name: "Pune")
        CitySport.create(city_id: 1, sport_id: 1, number_of_boxes: 5,number_of_players: 10)

        post '/api/v1/city_sports/display', params: {:token => "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSJ9.O5Y5s_hvEW8BM7E8jq6HihxQ0DDFxO_2_xtnrvVj4PY"}
    end
    it 'returns a ok status' do
        expect(response).to have_http_status(:ok)
    end
end