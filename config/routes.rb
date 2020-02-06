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
      # resources :confirmations, only: [:update, :show]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
