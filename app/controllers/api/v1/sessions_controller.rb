# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
        @user = User.find_by_email(params[:email])
        if @user&.valid_password?(params[:password])
          token = JsonWebToken.encode(user_id: @user.id)
          time = Time.now + 24.hours.to_i
          render json: {token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                         email: @user.email}, status: :ok
        else
          render json: {error: I18n.t("sessions.unauthorized")}, status: :unauthorized
        end
      end

      def destroy; end
    end
  end
end
