module Api
  module V1
    class MailersController < ApplicationController
      def confirm_link
        @token = request.params['confirmation_token']
        return redirect_to "app://boxapp/setpassword?confirm=#{@token}"
      end
    end
  end
end
