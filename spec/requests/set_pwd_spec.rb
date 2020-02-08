# frozen_string_literal: true

require "rails_helper"

describe "set pwd", type: :request do
  before do
    @user = FactoryBot.create(:user)
  end
  it "returns an ok status" do
    post  "/api/v1/setpwd",
          params: {
            "user": {
              "confirmation_token":    @user.confirmation_token,
              "password":              "123456",
              "password_confirmation": "123456"
            }
          }
    expect(response).to have_http_status(:ok)
  end
  it "returns service unavailable status" do
    post  "/api/v1/setpwd",
          params: {
            "user": {
              "confirmation_token":    @user.confirmation_token,
              "password":              "123456",
              "password_confirmation": "12345678"
            }
          }
    expect(response).to have_http_status(:service_unavailable)
  end
end
