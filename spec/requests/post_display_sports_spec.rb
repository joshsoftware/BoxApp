# frozen_string_literal: true

require "rails_helper"

describe "should display sports", type: :request do
  before do
    FactoryBot.create(:user)
    Sport.create(name: "Badminton")
    City.create(name: "Pune")
    CitySport.create(city_id: 1, sport_id: 1, number_of_boxes: 5, number_of_players: 10)
    @token1 = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSJ9.O5Y5s_hvEW8BM7E8jq6HihxQ0DDFxO_2_xtnrvVj4PY"
    @token2 = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiOCJ9.9V492uKokeLSu9F62ck-CX2XvrquAsTNc9_agkPcYzk"
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
        headers: {
          "user-auth-token" =>
                               "eyJhbGciOiJIUzI1NiIsInR5cuKokeLSu9F62ck-CX2XvrquAsTNc9_agkPcYzk"
        }
  end

  it "return a unauthorized status" do
    expect(response).to have_http_status(:unauthorized)
  end
end
