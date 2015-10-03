module Api
  module V1
    class WorkoutSetsController < ApiController
      def index
        workout_sets = WorkoutSet.where(workout_id: params[:workout_id])
        serialize workout_sets, list: true
      end

      def new
        workout = Workout.find(params[:workout_id])
        workout_set = workout.next_set
        if workout_set
          serialize workout_set, include: 'exercise'
        else
          serialize_error Errors::WorkoutComplete.new workout: workout
        end
      end

      def show
        workout_set = WorkoutSet.find(params[:id])
        render json: JSONAPI::Serializer.serialize(workout_set, is_collection: false)
      end
    end
  end
end
