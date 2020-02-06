require 'rails_helper'

describe "post token and return opponents list", :type => :request do
  before do 
    FactoryBot.create(:user)
    FactoryBot.create(:user)
    Sport.create(name: "Badminton")
    City.create(name: "Pune")
    CitySport.create(city_id: 1,sport_id: 1,number_of_boxes: 5,number_of_players: 5)
    Level.create(name: "B1")
    LevelCitySport.create(city_sport_id: 1,level_id: 1)
    UserCitySport.create(user_id: 1,city_sport_id: 1,level_city_sports_id:1)
    UserCitySport.create(user_id: 2 ,city_sport_id: 1,level_city_sports_id:1)
    post '/api/v1/list_opponents', params: {:token => "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSJ9.O5Y5s_hvEW8BM7E8jq6HihxQ0DDFxO_2_xtnrvVj4PY"} 
  end

  it 'returns a ok status' do
    expect(response).to have_http_status(:ok)
  end

end