# frozen_string_literal: true

require "rails_helper"

describe "should display all available sports for particular city", type: :request do
  context "should return all available sport" do
    it "returns a ok status" do
      @sport = Sport.create(name: "Badminton")
      @city = City.create(name: "Pune")
      @user = FactoryBot.create(:user, city_id: @city.id)
      @cs = CitySport.create(city_id: @city.id, sport_id: @sport.id, number_of_boxes: 5, number_of_players: 10)
      @token1 = JsonWebToken.encode(user_id: @user.id)
      get "/api/v1/city_sports/display", headers: {"user-auth-token" => @token1}
      expect(response).to have_http_status(:ok)
    end
  end

  context "should return error", type: :request do
    it "returns a unauthorized status due user not present" do
      @token2 = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiOCJ9.9V492uKokeLSu9F62ck-CX2XvrquAsTNc9_agkPcYzk"
      get "/api/v1/city_sports/display", headers: {"user-auth-token" => @token2}
      expect(response).to have_http_status(:unauthorized)
    end

    it "returns a unauthorized status due to jwt invalidation" do
      @token3 = "eyJhbGciOiJIUzI1NiIsInR5cuKokeLSu9F62ck-CX2XvrquAsTNc9_agkPcYzk"
      get "/api/v1/city_sports/display", headers: {"user-auth-token" => @token3}
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
