module Api
  module V1
    class UsersController < ApplicationController
      def create
        # @user = User.new(user_params)
        puts params
        usr = params["user"]
        @user = User.new(email: usr["email"], password: usr["password"], password_confirmation: usr["password_confirmation"])

        if @user.save!
          puts "done"# render :create
        else
          puts "nope"# head(:unprocessable_entity)
        end
      end

      # private

      # def user_params
      #   params.require(:user).permit(:email, :password, :password_confirmation)
      # end

    end
  end
end
