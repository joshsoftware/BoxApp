require 'rails_helper'

describe "should return opponents count ", :type => :request do
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
    get '/api/v1/list_opponents', headers: {"user-auth-token" => "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSJ9.O5Y5s_hvEW8BM7E8jq6HihxQ0DDFxO_2_xtnrvVj4PY"} 
  end

  it 'returns a ok status' do
    expect(response).to have_http_status(:ok)
  end

  it 'returns unauthorized error due to user_id not present' do
    expect(response). to have_http_status(:unauthorized)
  end 
end

describe "should return opponents list", :type => :request do
  before do 
    FactoryBot.create(:user)
    FactoryBot.create(:user)
    FactoryBot.create(:user)
    FactoryBot.create(:user)
    FactoryBot.create(:user)
    FactoryBot.create(:user)
    FactoryBot.create(:user)
    Sport.create(name: "Badminton")
    City.create(name: "Pune")
    CitySport.create(city_id: 1,sport_id: 1,number_of_boxes: 5,number_of_players: 5)
    Level.create(name: "B1")
    LevelCitySport.create(city_sport_id: 1,level_id: 1)
    UserCitySport.create(user_id: 3,city_sport_id: 1,level_city_sports_id:1)
    UserCitySport.create(user_id: 4 ,city_sport_id: 1,level_city_sports_id:1)
    UserCitySport.create(user_id: 5 ,city_sport_id: 1,level_city_sports_id:1)
    UserCitySport.create(user_id: 6 ,city_sport_id: 1,level_city_sports_id:1)
    UserCitySport.create(user_id: 7 ,city_sport_id: 1,level_city_sports_id:1)
    UserCitySport.create(user_id: 8 ,city_sport_id: 1,level_city_sports_id:1)
    UserCitySport.create(user_id: 9 ,city_sport_id: 1,level_city_sports_id:1)
    get '/api/v1/list_opponents', headers: {"user-auth-token" => "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMyJ9.IpKHz7JL6PXBjYOAPZ4BUBUZHUdf7OwMKGJkPs-ixQA"} 
  end

  it 'returns a ok status' do
    expect(response).to have_http_status(:ok)
  end
end

describe "should return error due jwt invalidation", :type => :request do
  before do 
    get '/api/v1/list_opponents', headers: {"user-auth-token" => "eyJhbGciOiJIRVyX2lkIjoiMSJ9.O5Y5s_hvEW8BM7E8jq6HihxQ0DDFxO_2_xtnrvVj4PY"} 
  end

  it 'returns unauthorized error due to JWT token error' do
    expect(response). to have_http_status(:unauthorized)
  end
end



