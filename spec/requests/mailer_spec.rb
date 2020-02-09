# frozen_string_literal: true

require "spec_helper"

describe "Confirmation Link", type: :request do
  before do
    @user = FactoryBot.create(:user)
  end

  it "redirects to set password page if email not confirmed" do
    get "/api/v1/confirm_link?confirmation_token=#{@user.confirmation_token}"
    expect(response).to redirect_to("app://boxapp/setpassword?confirm=#{@user.confirmation_token}")
  end

  it "redirects to set intro page if email is already confirmed" do
    post "/api/v1/set_password",
         params: {
           "user": {
             "confirmation_token":    @user.confirmation_token,
             "password":              "123456",
             "password_confirmation": "123456"
           }
         }
    get "/api/v1/confirm_link?confirmation_token=#{@user.confirmation_token}"
    expect(response).to redirect_to("app://boxapp/intro")
  end
end
