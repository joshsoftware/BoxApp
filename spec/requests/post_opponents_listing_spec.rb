# frozen_string_literal: true

require "rails_helper"

describe "should return opponents count ", type: :request do
  before do
    @sport1 = Sport.create(name: "Badminton")
    @city1 = City.create(name: "Pune")
    @user1 = FactoryBot.create(:user, city_id: @city1.id)
    @user2 = FactoryBot.create(:user, city_id: @city1.id)
    @citysport1 = CitySport.create(city_id:           @city1.id,
                                   sport_id:          @sport1.id,
                                   number_of_boxes:   5,
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
    get "/api/v1/list_opponents", headers: {"user-auth-token" => @token1}
    expect(response).to have_http_status(:ok)
  end

  it "returns unauthorized error due to user_id not present" do
    get "/api/v1/list_opponents", headers: {"user-auth-token" => JsonWebToken.encode(user_id: 123)}
    expect(response). to have_http_status(:unauthorized)
  end
end

describe "should return opponents list", type: :request do
  before do
    @sport2 = Sport.create(name: "Badminton")
    @city2 = City.create(name: "Pune")
    @user3 = FactoryBot.create(:user, city_id: @city2.id)
    @user4 = FactoryBot.create(:user, city_id: @city2.id)
    @user5 = FactoryBot.create(:user, city_id: @city2.id)
    @user6 = FactoryBot.create(:user, city_id: @city2.id)
    @user7 = FactoryBot.create(:user, city_id: @city2.id)
    @user8 = FactoryBot.create(:user, city_id: @city2.id)
    @user9 = FactoryBot.create(:user, city_id: @city2.id)

    @citysport2 = CitySport.create(city_id:           @city2.id,
                                   sport_id:          @sport2.id,
                                   number_of_boxes:   5,
                                   number_of_players: 5)
    @level2 = Level.create(name: "B1")
    @levelcitysport2 = LevelCitySport.create(city_sport_id: @citysport2.id, level_id: @level2.id)
    @usercitysport3 = UserCitySport.create(user_id:              @user3.id,
                                           city_sport_id:        @citysport2.id,
                                           level_city_sports_id: @levelcitysport2.id)
    @usercitysport4 = UserCitySport.create(user_id:              @user4.id,
                                           city_sport_id:        @citysport2.id,
                                           level_city_sports_id: @levelcitysport2.id)
    @usercitysport5 = UserCitySport.create(user_id:              @user5.id,
                                           city_sport_id:        @citysport2.id,
                                           level_city_sports_id: @levelcitysport2.id)
    @usercitysport6 = UserCitySport.create(user_id:              @user6.id,
                                           city_sport_id:        @citysport2.id,
                                           level_city_sports_id: @levelcitysport2.id)
    @usercitysport7 = UserCitySport.create(user_id:              @user7.id,
                                           city_sport_id:        @citysport2.id,
                                           level_city_sports_id: @levelcitysport2.id)
    @usercitysport8 = UserCitySport.create(user_id:              @user8.id,
                                           city_sport_id:        @citysport2.id,
                                           level_city_sports_id: @levelcitysport2.id)
    @usercitysport9 = UserCitySport.create(user_id:              @user9.id,
                                           city_sport_id:        @citysport2.id,
                                           level_city_sports_id: @levelcitysport2.id)
    @token2 = JsonWebToken.encode(user_id: @user3.id)
    get "/api/v1/list_opponents", headers: {"user-auth-token" => @token2}
  end

  it "returns a ok status" do
    expect(response).to have_http_status(:ok)
  end
end

describe "should return error due jwt invalidation", type: :request do
  before do
    @token3 = "eyJhbGciOiJIRVyX2lkIjoiMSJ9.O5Y5s_hvEW8BM7E8jq6HihxQ0DDFxO_2_xtnrvVj4PY"
    get "/api/v1/list_opponents", headers: {"user-auth-token" => @token3}
  end

  it "returns unauthorized error due to JWT token error" do
    expect(response). to have_http_status(:unauthorized)
  end
end
