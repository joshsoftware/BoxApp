# frozen_string_literal: true

require "rails_helper"

describe "post a level and sport", type: :request do
  before do
    user = FactoryBot.create(:user, city_id: 2)
    # puts "ID #{u.id}"
    token = JsonWebToken.encode(user_id: user.id)
    sp = Sport.create(name: "Badminton")
    ct = City.create(name: "Pune")
    CitySport.create(city_id: ct.id, sport_id: sp.id, number_of_boxes: 5, number_of_players: 10)
    l = Level.create(name: "B1", description: "Intermediate - Difficult")

    post "/api/v1/level_sports",
         params: {
           token:      token,
           sport_id:   sp.id,
           level_name: l.name
         }
  end

  it "returns a ok status" do
    expect(response).to have_http_status(:ok)
  end
end
