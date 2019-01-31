Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :client do
        resources :sessions
        resources :users
        resources :patients
      end
    end
  end

end
