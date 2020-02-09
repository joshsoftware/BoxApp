# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users
      resources :sessions, only: %i[create destroy]
      resource :user, only: %i[show update create]
      post "/set_password", to: "users#set_password"
      get "confirm_link", to: "mailers#confirm_link"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
