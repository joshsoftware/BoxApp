module Api
  module V1
    class ConfirmationsController < Devise::ConfirmationsController

      protected

      def after_confirmation_path_for(resource_name, resource)
        token = resource.send(:set_reset_password_token)
        edit_password_path(resource, reset_password_token: token)
      end
    end
  end
end