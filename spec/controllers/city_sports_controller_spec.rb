require 'rails_helper'

module Api
  module V1
    RSpec.describe CitySportsController, type: :controller do
      it 'should render create action' do
        post :displaysports, params: {'token' => 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSJ9.O5Y5s_hvEW8BM7E8jq6HihxQ0DDFxO_2_xtnrvVj4PY'}
        expect(response).to have_http_status(:displaysports)
      end
    end
  end
end 