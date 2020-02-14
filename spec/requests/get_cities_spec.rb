# frozen_string_literal: true

require "rails_helper"

describe "get all cities", type: :request do
  before do
    get "/api/v1/cities"
  end

  it "returns http success" do
    expect(response).to have_http_status(:success)
  end
end
