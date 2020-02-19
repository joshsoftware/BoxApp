# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/city_sport_levels", to: "levels#all_levels"
      resources :levels
    end
  end
end
