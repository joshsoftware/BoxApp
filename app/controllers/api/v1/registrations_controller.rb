# frozen_string_literal: true

module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      skip_before_action :validate_token, only: [:create]
      include ActionController::Helpers
      include ActionController::Flash
      respond_to :json

      def create
        build_resource(sign_up_params)

        resource.save
        yield resource if block_given?
        if resource.persisted?
          if resource.active_for_authentication?
            set_flash_message :notice, :signed_up if is_flashing_format?
            msg = find_message(:signed_up, {})
            sign_up(resource_name, resource)
            respond_with(resource) do |_format|
              render json: {url: after_sign_up_path_for(resource)}, status: 200
              return
            end
          else
            set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
            msg = find_message(:"signed_up_but_#{resource.inactive_message}", {})
            expire_data_after_sign_in!
            respond_with(resource) do |_format|
              @url = ["http://192.168.1.84:3000/api/v1/",
                      "confirm_link?confirmation_token=#{resource.confirmation_token}"]
              render json:   {message: msg,
                              url:     @url},
                     status: 200
              return
            end
          end
        else
          clean_up_passwords resource
          respond_with(resource) do |_format|
            msg = resource.errors.full_messages.join("<br>").html_safe
            render json: {message: msg}, status: 401
            return
          end
        end
      end

      private

      def sign_up_params
        params.require(:user).permit(:first_name,
                                     :last_name,
                                     :contact_number,
                                     :is_admin,
                                     :city_id,
                                     :email,
                                     :password,
                                     :password_confirmation)
      end
    end
  end
end
