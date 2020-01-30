Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      post '/usrcnf', to: 'users#confirm'
      post '/auth/login', to: 'authentication#login'
    end
  end
end
