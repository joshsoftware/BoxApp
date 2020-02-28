# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users
  namespace :api do
    namespace :v1 do
      devise_for :users # , :controllers => { registrations: 'registrations' }
      resources :sessions, only: %i[create destroy]
      resource :user, only: %i[show update create]
      post "/setpwd", to: "users#setpwd"
      get "confirm_link", to: "mailers#confirm_link"
      post "/level_sports", to: "level_sports#create"
      resources :levels
      resources :cities
      resources :city_sports
      post "/city_sports/display", to: "city_sports#displaysports"
      # resources :confirmations, only: [:update, :show]
      get "/list_opponents", to: "list_opponents#opponents"
      get "/city_sport_levels", to: "levels#all_levels"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
