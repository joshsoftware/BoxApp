module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController

      private

      def sign_up_params
        params.require(:user).permit(:first_name, :last_name, :contact_number, :is_admin, :city_id, :email, :password, :password_confirmation)
      end

      def account_update_params
        params.require(:user).permit(:first_name, :last_name, :contact_number, :is_admin, :city_id, :email, :password, :password_confirmation, :current_password)
      end
    end
  end
end
