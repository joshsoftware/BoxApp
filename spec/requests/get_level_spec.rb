# frozen_string_literal: true

require "rails_helper"

describe "get all levels", type: :request do
  before do
    get "/api/v1/levels"
  end

  it "returns http success" do
    expect(response).to have_http_status(:success)
  end
end

describe "levels in a sport for a city", type: :request do
  before do
    @sport1 = Sport.create(name: "Badminton")
    @city1 = City.create(name: "Pune")
    @user1 = FactoryBot.create(:user, city_id: @city1.id)
    @user2 = FactoryBot.create(:user, city_id: @city1.id)
    @citysport1 = CitySport.create(city_id:           @city1.id,
                                   sport_id:          @sport1.id,
                                   number_of_boxes:   6,
                                   number_of_players: 5)
    @level1 = Level.create(name: "B1")
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
    post  "/api/v1/city_sport_levels",
          headers: {"user-auth-token" => @token1},
          params:  {"sport_id" => @sport1.id}
    expect(response).to have_http_status(:ok)
  end
end
