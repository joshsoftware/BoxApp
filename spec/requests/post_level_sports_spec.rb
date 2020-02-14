# frozen_string_literal: true

require "rails_helper"

describe "post a level and sport", type: :request do
  before do
    @sport1 = FactoryBot.create(:sport)
    @sport2 = FactoryBot.create(:sport)
    @city1 = FactoryBot.create(:city)
    @city2 = FactoryBot.create(:city)
    @user1 = FactoryBot.create(:user, city_id: @city1.id)
    @user2 = FactoryBot.create(:user, city_id: @city1.id)
    @city_sport = CitySport.create(city_id:           @city1.id,
                                   sport_id:          @sport1.id,
                                   number_of_boxes:   5,
                                   number_of_players: 10)
    CitySport.create(city_id:           @city2.id,
                     sport_id:          @sport2.id,
                     number_of_boxes:   5,
                     number_of_players: 10)
    @level = FactoryBot.create(:level)
    LevelCitySport.create(city_sport_id: @city_sport.id, level_id: @level.id)
    @token1 = JsonWebToken.encode(user_id: @user1.id)
    @token2 = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSJ9.O5Y5s_hvEW8BM7E8jq6HihxQ0DDFxO_2_xtnrvVj4PY"
    @token3 = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSJ9.O5Y5Y"
    post  "/api/v1/level_sports",
          headers: {"user-auth-token" => @token1},
          params:  {
            sport_id: @sport1.id,
            level_id: @level.id
          }
  end

  context "should return created" do
    it "returns a ok status" do
      expect(response).to have_http_status(:created)
    end
  end

  context "should return jwt error" do
    it "return unauthorized status" do
      post  "/api/v1/level_sports",
            headers: {"user-auth-token" => @token2},
            params:  {
              sport_id: @sport1.id,
              level_id: @level.id
            }
      expect(response).to have_http_status(:unauthorized)
    end

    it "return unauthorized status" do
      post "/api/v1/level_sports", headers: {"user-auth-token" => @token3},
                                   params:  {sport_id: 1, level_id: 1}
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
