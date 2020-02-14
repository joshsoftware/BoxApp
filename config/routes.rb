# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/city_sports/display", to: "city_sports#displaysports"
      resources :city_sports
      post "/level_sports", to: "level_sports#create"
    end
  end
end
