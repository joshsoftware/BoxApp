module Api
  module V1
    class MailersController < ActionController::Base
      def confirm_link
        return redirect_to "http://www.google.com"
        # render json: { data: render_to_string('confirm_link.html.erb') }
      end
    end
  end
end
