# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users # , :controllers => { registrations: 'registrations' }
      resources :sessions, only: %i[create destroy]
      resource :user, only: %i[show update create]
      post "/set_password", to: "users#set_password"
      get "confirm_link", to: "mailers#confirm_link"
      post "/level_sports", to: "level_sports#create"
      resources :levels
      resources :cities
      get "/city_sports/display", to: "city_sports#displaysports"
      resources :city_sports
      # resources :confirmations, only: [:update, :show]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
