# frozen_string_literal: true

require "rails_helper"

describe "should display sports", type: :request do
  before do
    @sport = Sport.create(name: "Badminton")
    @city = City.create(name: "Pune")
    @user = FactoryBot.create(:user, city_id: @city.id)
    @cs = CitySport.create(city_id: @city.id, sport_id: @sport.id, number_of_boxes: 5, number_of_players: 10)
    @token1 = JsonWebToken.encode(user_id: @user.id)
    @token2 = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiOCJ9.9V492uKokeLSu9F62ck-CX2XvrquAsTNc9_agkPcYzk"
    @token3 = "eyJhbGciOiJIUzI1NiIsInR5cuKokeLSu9F62ck-CX2XvrquAsTNc9_agkPcYzk"
    get "/api/v1/city_sports/display",
        headers: {"user-auth-token" => @token1}
  end
  it "returns a ok status" do
    expect(response).to have_http_status(:ok)
  end
end

describe "should return unauthorized due to user not present", type: :request do
  before do
    FactoryBot.create(:user)
    get "/api/v1/city_sports/display",
        headers: {"user-auth-token" => @token2}
  end

  it "return a unauthorized status" do
    expect(response).to have_http_status(:unauthorized)
  end
end

describe "should return unauthorized due to invalid jwt token", type: :request do
  before do
    FactoryBot.create(:user)
    get "/api/v1/city_sports/display",
        headers: {"user-auth-token" => @token3}
  end

  it "return a unauthorized status" do
    expect(response).to have_http_status(:unauthorized)
  end
end
