# frozen_string_literal: true

require "rails_helper"

describe "post a level and sport", type: :request do
  before do
    FactoryBot.create(:user)
    sport = Sport.create(name: "Badminton")
    city = City.create(name: "Pune")
    CitySport.create(city_id: city.id, sport_id: sport.id, number_of_boxes: 5, number_of_players: 10)
    level = Level.create(name: "B1")
    @token1 = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSJ9.O5Y5s_hvEW8BM7E8jq6HihxQ0DDFxO_2_xtnrvVj4PY"
    @token2 = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSJ9.O5Y5s_hvEW8BM7E8jq6HihxQ0DDFxO_2_xtnrvVj4PY"
    @token3 = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSJ9.O5Y5Y"
    post  "/api/v1/level_sports",
          headers: {"user-auth-token" => @token1},
          params:  {
            sport_id: sport.id,
            level_id: level.id
          }
  end

  it "returns a ok status" do
    expect(response).to have_http_status(:ok)
  end
end

describe "should return unauthorized due to user not present", type: :request do
  before do
    post  "/api/v1/level_sports",
          headers: {"user-auth-token" => @token2},
          params:  {
            sport_id: 1,
            level_id: 1
          }
  end

  it "return unauthorized status" do
    expect(response).to have_http_status(:unauthorized)
  end
end

describe "should return unauthorized due invalid jwt token", type: :request do
  before do
    post "/api/v1/level_sports", headers: {"user-auth-token" => @token3}, params: {sport_id: 1, level_id: 1}
  end

  it "return unauthorized status" do
    expect(response).to have_http_status(:unauthorized)
  end
end
