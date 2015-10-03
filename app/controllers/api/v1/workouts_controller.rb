module Api
  module V1
    class WorkoutsController < ApiController
      around_action :check_for_workout_in_progress, only: [:new, :create]

      def index
        serialize Workout.all, list: true
      end

      def show
        serialize Workout.find(params[:id]), include: params[:include]
      end

      def new
        serialize Workout.new(user: current_user), include: 'user'
      end

      def create
        workout = Workout.new(create_params)
        if workout.save
          serialize workout, status: 201, headers: { "Location" => api_v1_workouts_url(workout) }
        else
          serialize_error Errors::ValidationError.new(resource: workout)
        end
      end

      private

      def workout_params
        params.require(:data).permit(relationships: [{ routine: { data: :id } }, { user: { data: :id } }])
      end

      def relationship_params
        workout_params[:relationships]
      end

      def relationship(name)
        (relationship_params[name] && relationship_params[name][:data]) || {}
      end

      def create_params
        { routine_id: relationship(:routine)[:id], user_id: relationship(:user)[:id] }
      end

      def check_for_workout_in_progress
        if workout_in_progress?
          serialize_error Errors::WorkoutInProgress.new(workout: workout_in_progress)
        else
          yield
        end
      end

      def workout_in_progress?
        !!workout_in_progress
      end

      def workout_in_progress
        Workout.includes(:workout_sets, routine: :routine_sets).in_progress.for_user(current_user).first
      end
    end
  end
end
