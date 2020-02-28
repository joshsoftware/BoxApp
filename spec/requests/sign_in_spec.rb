# frozen_string_literal: true

require "rails_helper"

describe "sign in", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @user.password = "123456"
    @user.password_confirmation = "123456"
    @user.save
  end
  it "returns an ok status" do
    post  "/api/v1/sessions",
          params: {
            "email":    @user.email,
            "password": @user.password
          }
    expect(response).to have_http_status(:ok)
  end
  it "returns unauthorized status" do
    post  "/api/v1/sessions",
          params: {
            "email":    @user.email,
            "password": "1234567"
          }
    expect(response).to have_http_status(:unauthorized)
  end
end
