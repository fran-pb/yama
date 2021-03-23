Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :movies
      resources :people
      resources :users
    end
  end

end
