# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/list_opponents", to: "list_opponents#opponents"
      post "/level_sports", to: "level_sports#create"
    end
  end
end
