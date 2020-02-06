# frozen_string_literal: true

require "rails_helper"

describe "sign in", type: :request do
  before do
    Sport.create(name: "Badminton")
    City.create(name: "Pune")
    CitySport.create(city_id: 1, sport_id: 1, number_of_boxes: 5, number_of_players: 10)
    Level.create(name: "B1")
    User.create(first_name:            "mayur",
                last_name:             "deshmukh",
                contact_number:        "2132131231",
                is_admin:              false,
                email:                 "ksnehanjali@gmail.com",
                city_id:               1,
                password:              "123456",
                password_confirmation: "123456")
    post  "/api/v1/sessions",
          params: {
            "email":    "ksnehanjali@gmail.com",
            "password": "123456"
          }
  end
  it "returns an ok status" do
    expect(response).to have_http_status(:ok)
  end
end
