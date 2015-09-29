module Api
  module V1
    class WorkoutSetsController < ApplicationController
      def index
        workout_sets = WorkoutSet.where(workout_id: params[:workout_id])
        render json: JSONAPI::Serializer.serialize(workout_sets, is_collection: true, include: 'exercise')
      end

      def show
        workout_set = WorkoutSet.find(params[:id])
        render json: JSONAPI::Serializer.serialize(workout_set, is_collection: false, include: 'exercise')
      end
    end
  end
end
