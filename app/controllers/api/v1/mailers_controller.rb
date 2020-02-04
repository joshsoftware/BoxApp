module Api
  module V1
    class MailersController < ApplicationController
      def confirm_link
        @token = request.params['confirmation_token']
        return redirect_to "app://boxapp/setpassword/confirmation?confirmation_token=#{@token}"
      end
    end
  end
end
