# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  def
   not_found
    render json: {error: "not_found"}
  end

  def authorize_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: {errors: e.message}, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: {errors: e.message}, status: :unauthorized
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u|
      u.permit(:first_name,
               :last_name,
               :contact_number,
               :is_admin,
               :city_id,
               :email,
               :password)
    }
    devise_parameter_sanitizer.permit(:account_update) {|u|
      u.permit(:first_name,
               :last_name,
               :contact_number,
               :is_admin,
               :city_id,
               :email,
               :password,
               :current_password)
    }
  before_action :validate_token

  def validate_token
    user_auth_token = request.headers["user-auth-token"]
    @current_user = current_user(user_auth_token)
  end

  def current_user(user_auth_token)
    token = JsonWebToken.decode(user_auth_token)
    return render json: {error: I18n.t("jwt_error.invalid_jwt")}, status: :unauthorized if token.empty?

    begin
      user_id = token["user_id"]
      user = User.find(user_id)
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message}, status: :unauthorized
    end
    user
  end
  end
end
