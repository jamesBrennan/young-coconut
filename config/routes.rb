Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  namespace :api do
    namespace :v1 do
      resources :workouts, format: :json do
        resources :workout_sets
      end
      resources :routines, format: :json do
        resources :routine_sets
      end
    end
  end

  root to: 'home#index'
end
