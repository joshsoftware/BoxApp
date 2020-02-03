Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :city_sports
      post '/city_sports/display', to: 'city_sports#displaysports'

    end
  end
end
