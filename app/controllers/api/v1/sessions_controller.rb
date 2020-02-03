class Api::V1::SessionsController < ApplicationController
  def create
    # @user = User.where(email: params[:email]).first

    # if @user&.valid_password?(params[:password])
    #   render json: user.as_json(only: [:email]), status: :created
    # else
    #   head(:unauthorized)
    # end
    @user = User.find_by_email(params[:email])
    if @user&.valid_password?(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     email: @user.email }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def destroy
  end

end