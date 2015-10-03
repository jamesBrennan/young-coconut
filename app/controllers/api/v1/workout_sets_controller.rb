module Api
  module V1
    class WorkoutSetsController < ApplicationController
      def index
        workout_sets = WorkoutSet.where(workout_id: params[:workout_id])
        render json: JSONAPI::Serializer.serialize(workout_sets, is_collection: true)
      end

      def new
        workout_set = Workout.find(params[:workout_id]).next_set
        if workout_set
          render json: JSONAPI::Serializer.serialize(workout_set, is_collection: false, include: 'exercise')
        else
          head 409
        end
      end

      def show
        workout_set = WorkoutSet.find(params[:id])
        render json: JSONAPI::Serializer.serialize(workout_set, is_collection: false)
      end
    end
  end
end
