# frozen_string_literal: true

module Api
  module V1
    class MailersController < ApplicationController
      skip_before_action :validate_token, only: [:confirm_link]
      def confirm_link
        @token = request.params["confirmation_token"]
        @user = User.find_by(confirmation_token: @token)
        if @user
          redirect_to "app://boxapp/setpassword?confirm=#{@token}"
        else
          redirect_to "app://boxapp/intro"
        end
      end
    end
  end
end
