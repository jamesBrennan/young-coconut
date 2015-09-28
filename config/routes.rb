Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :workouts, format: :json
      resources :routines, format: :json do
        resources :routine_sets
      end
    end
  end
end
