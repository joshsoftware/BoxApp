# frozen_string_literal: true

require "rails_helper"

describe "post a token and display sports", type: :request do
  before do
    user = FactoryBot.create(:user)
    # puts "ID #{u.id}"
    token = JsonWebToken.encode(user_id: user.id)
    sp = Sport.create(name: "Badminton")
    ct = City.create(name: "Pune")
    CitySport.create(city_id: ct.id, sport_id: sp.id, number_of_boxes: 5, number_of_players: 10)

    post  "/api/v1/city_sports/display",
          params: {token: token}
  end
  it "returns a ok status" do
    expect(response).to have_http_status(:ok)
  end
end
