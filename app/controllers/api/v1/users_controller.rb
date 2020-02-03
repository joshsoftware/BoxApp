module Api
  module V1
    class UsersController < ApplicationController
      def create
        # @user = User.new(user_params)
        puts params
        usr = params["user"]
        @user = User.find_by(confirmation_token: usr["confirmation_token"])
        @user.password = usr["password"]
        @user.password_confirmation = usr["password_confirmation"]
        @user.confirmed_at = DateTime.now
        if @user.save
          token = JsonWebToken.encode(user_id: @user.id)
          time = Time.now + 24.hours.to_i
          render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                         email: @user.email }, status: :ok
        else
          render json: { error: 'unauthorized' }, status: :unauthorized
        end
        #   puts "done"# render :create
        # else
        #   puts "nope"# head(:unprocessable_entity)
        # end
      end

      # private

      # def user_params
      #   params.require(:user).permit(:email, :password, :password_confirmation)
      # end

    end
  end
end
