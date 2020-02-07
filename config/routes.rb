Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      get '/city_sports/display', to: 'city_sports#displaysports'
      resources :city_sports

    end
  end
end
