# frozen_string_literal: true

require "rails_helper"
RSpec.describe Api::V1::RegistrationsController, type: :controller do
  describe "sign up", type: :request do
    before :each do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @success_msg =  ["A message with a confirmation link has been sent to your email address.",
                      " Please follow the link to activate your account."]
      @failure_msg = "Email has already been taken"
      @user = {
        "first_name": "dev",
        "last_name": "pradhan",
        "contact_number": "9798123123",
        "is_admin": false,
        "city_id": 10,
        "email": "dvaa13@gmail.com"
      }
    end
    it "returns an ok status" do
      post  "/api/v1/users",
            params: {
              "user": @user
            }
      expect(response).to have_http_status(:ok)
      expect(flash[:notice]).to eq @success_msg[0]+@success_msg[1]
    end
    it "returns unauthorized status" do
      @user = FactoryBot.create(:user)
      post  "/api/v1/users",
            params: {
              "user": {
                "first_name": "dev",
                "last_name": "pradhan",
                "contact_number": "9798123123",
                "is_admin": false,
                "city_id": 10,
                "email": @user.email
              }
            }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end