module Api
  module V1
    class UsersController < ApplicationController
      def index
        puts "in index"
        render json: User.all.as_json
      end

      def new
        puts params
        puts "in new"
        user = JSON.parse(json_string, object_class: User)
      end

      def create
        puts "in create"
        usr = params['user']
        User.create(first_name: usr['first_name'], last_name: usr['last_name'], contact_number: usr['contact_number'], role: false, email: usr['email'], password: usr['password'], city_id: usr['city_id'])
      end
    end
  end
end
