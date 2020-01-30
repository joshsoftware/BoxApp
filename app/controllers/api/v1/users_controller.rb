module Api
  module V1
    class UsersController < ApplicationController
      # before_action :authorize_request, except: :create, :index
      def index
        render json: User.all.as_json
      end

      def new
        user = JSON.parse(json_string, object_class: User)
      end

      def confirm
        @usr = User.last
        UserMailer.email_confirmation(@usr).deliver_now

      end

      def create
        usr = params['user']
        if User.create!(first_name: usr['first_name'], last_name: usr['last_name'], contact_number: usr['contact_number'], role: false, email: usr['email'], password: usr['password'], city_id: usr['city_id'])
          puts "in if #{usr}"
          user_obj = User.find_by_email(usr['email'])
          token = JsonWebToken.encode(user_id: user_obj.id)
          time = Time.now + 24.hours.to_i
          render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                         email: user_obj.email }, status: :ok
        else
          render json: { error: 'unauthorized' }, status: :unauthorized
        end
      end
    end
  end
end
