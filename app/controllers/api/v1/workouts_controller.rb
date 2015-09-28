module Api
  module V1
    class WorkoutsController < ApplicationController
      def index
        workouts = Workout.all
        render json: JSONAPI::Serializer.serialize(workouts, is_collection: true)
      end
    end
  end
end
