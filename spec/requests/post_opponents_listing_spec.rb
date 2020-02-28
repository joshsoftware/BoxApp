# frozen_string_literal: true

require "rails_helper"

describe "should return all opponents ", type: :request do
  context "returns opponents" do
    before do
      @sport1 = FactoryBot.create(:sport)
      @city1 = FactoryBot.create(:city)
      @user1 = FactoryBot.create(:user, city_id: @city1.id)
      @user2 = FactoryBot.create(:user, city_id: @city1.id)
      @citysport1 = CitySport.create(city_id:           @city1.id,
                                     sport_id:          @sport1.id,
                                     number_of_boxes:   5,
                                     number_of_players: 5)
      @level1 = FactoryBot.create(:level)
      @levelcitysport1 = LevelCitySport.create(city_sport_id: @citysport1.id,
                                               level_id:      @level1.id)
      @usercitysport1 = UserCitySport.create(user_id:              @user1.id,
                                             city_sport_id:        @citysport1.id,
                                             level_city_sports_id: @levelcitysport1.id)
      @usercitysport2 = UserCitySport.create(user_id:              @user2.id,
                                             city_sport_id:        @citysport1.id,
                                             level_city_sports_id: @levelcitysport1.id)
      @token1 = JsonWebToken.encode(user_id: @user1.id)
    end

    it "returns a ok status" do
      get "/api/v1/list_opponents", headers: {"user-auth-token" => @token1}
      expect(response).to have_http_status(:ok)
    end
  end

  context "returns error" do
    it "returns unauthorized error due to user not present" do
      @token2 = JsonWebToken.encode(user_id: 100)
      get "/api/v1/list_opponents", headers: {"user-auth-token" => @token2}
      expect(response). to have_http_status(:unauthorized)
    end

    it "returns unauthorized error due to JWT token error" do
      @token3 = "eyJhbGciOiJIRVyX2lkIjoiMSJ9.O5Y5s_hvEW8BM7E8jq6HihxQ0DDFxO_2_xtnrvVj4PY"
      get "/api/v1/list_opponents", headers: {"user-auth-token" => @token3}
      expect(response). to have_http_status(:unauthorized)
    end
  end
end
