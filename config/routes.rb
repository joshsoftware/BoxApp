# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users
      get "/city_sport_levels", to: "levels#all_levels"
      resources :levels
      post "/level_sports", to: "level_sports#create"
      resources :sessions, only: %i[create destroy]
      resource :user, only: %i[show update create]
      post "/set_password", to: "users#set_password"
      get "confirm_link", to: "mailers#confirm_link"
    end
  end
end
