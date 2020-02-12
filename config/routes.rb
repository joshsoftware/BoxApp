# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :user_city_sports, only: [:index]
    end
  end
end
