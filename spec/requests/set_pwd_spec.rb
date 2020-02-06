# frozen_string_literal: true

require "rails_helper"

describe "set pwd", type: :request do
  before do
    Sport.create(name: "Badminton")
    City.create(name: "Pune")
    CitySport.create(city_id: 1, sport_id: 1, number_of_boxes: 5, number_of_players: 10)
    Level.create(name: "B1")
    u = User.create(first_name:     "mayur",
                    last_name:      "deshmukh",
                    contact_number: "2132131231",
                    is_admin:       false,
                    email:          "ksnehanjali@gmail.com",
                    city_id:        1)

    post  "/api/v1/setpwd",
          params: {
            "user": {
              "confirmation_token":    u.confirmation_token,
              "password":              "123456",
              "password_confirmation": "123456"
            }
          }
  end
  it "returns an ok status" do
    expect(response).to have_http_status(:ok)
  end
end
