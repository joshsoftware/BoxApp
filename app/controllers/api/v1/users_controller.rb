module Api
  module V1
    class UsersController < ApplicationController
      def create
      end

      def setpwd
        puts params
        usr = params["user"]
        @user = User.find_by(confirmation_token: usr["confirmation_token"])
        @user.password = usr["password"]
        @user.password_confirmation = usr["password_confirmation"]
        @user.confirmed_at = DateTime.now
        if @user.save
          @user.confirmation_token = nil
          @user.save
          token = JsonWebToken.encode(user_id: @user.id)
          time = Time.now + 24.hours.to_i
          render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                         email: @user.email }, status: :ok
        else
          render json: { error: 'service unavailable' }, status: :service_unavailable
        end
      end
    end
  end
end
