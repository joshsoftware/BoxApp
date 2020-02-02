Rails.application.routes.draw do
  # devise_for :users
  namespace :api do
    namespace :v1 do
      devise_for :users #, :controllers => { registrations: 'registrations' }
      # resources :sessions, only: [:create, :destroy]
      # resources :users, only: [:create]
      # resources :confirmations, only: [:update, :show]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
