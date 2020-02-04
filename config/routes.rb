Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/level_sports', to: 'level_sports#create'
    end
  end
end
