require 'rails_helper'

describe "get all levels", :type => :request do
    
    before do
      get '/api/v1/levels'
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
end  