Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/list_opponents', to: 'list_opponents#opponents'
    end
  end
end
