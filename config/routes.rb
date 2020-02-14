# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cities, only: [:index]
      post "/level_sports", to: "level_sports#create"
    end
  end
end
