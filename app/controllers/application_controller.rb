# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :validate_token

  def validate_token
    user_auth_token = request.headers["user-auth-token"]
    @current_user = current_user(user_auth_token)
  rescue JWT::DecodeError => e
    render json: {error: e.message}, status: :unauthorized
  rescue ActiveRecord::RecordNotFound => e
    render json: {error: e.message}, status: :unauthorized
  end

  def current_user(user_auth_token)
    token = JsonWebToken.decode(user_auth_token)
    user_id = token["user_id"]
    user = User.find(user_id)
    user
  end
end
