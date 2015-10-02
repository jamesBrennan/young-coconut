module Api
  module V1
    class WorkoutsController < ApplicationController
      around_action :check_for_workout_in_progress, only: [:new, :create]

      def index
        serialize_list Workout.all
      end

      def show
        serialize Workout.find(params[:id])
      end

      def new
        serialize Workout.new(user: current_user), include: 'user'
      end

      def create
        workout = Workout.new(create_params)
        if workout.save
          headers = { "Location" => api_v1_workouts_url(workout) }
          serialize workout, headers: headers, status: 201
        else
          render json: invalid_attributes_error(workout), status: 422
        end
      end

      private

      def workout_params
        params.require(:data).permit(relationships: [{ routine: { data: :id } }, { user: { data: :id } }])
      end

      def relationship_params
        workout_params[:relationships]
      end

      def routine_params
        (relationship_params[:routine] && relationship_params[:routine][:data]) || {}
      end

      def user_params
        (relationship_params[:user] && relationship_params[:user][:data]) || {}
      end

      def create_params
        { routine_id: routine_params[:id], user_id: user_params[:id] }
      end

      def check_for_workout_in_progress
        if workout_in_progress?
          render json: workout_in_progress_error(workout_in_progress), status: 409
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

      def workout_in_progress_error(workout)
        {error: {
          status: "409",
          code: "WORKOUT_IN_PROGRESS",
          title: "A workout is already in progress. A new workout can not be started until the current workout is completed.",
          detail: workout.detail,
          meta: {
            conflicting_resource: JSONAPI::Serializer.serialize(workout, is_collection: false)
          }
        }}
      end

      def invalid_attributes_error(workout)
        {error: {
          status: "422",
          code: "INVALID_ATTRIBUTES",
          title: "A workout could not be created using the provided attributes.",
          meta: {
            validation_errors: workout.errors
          }
        }}
      end

      def serialize(workout, opts = {})
        includes = opts[:include]
        headers = opts[:headers]
        status = opts[:status] || 200
        body = JSONAPI::Serializer.serialize(workout, is_collection: false, include: includes)
        render json: body, status: status, headers: headers
      end

      def serialize_list(workouts, opts = {})
        includes = opts[:include]
        headers = opts[:headers]
        status = opts[:status] || 200
        body = JSONAPI::Serializer.serialize(workouts, is_collection: true, include: includes)
        render json: body, status: status, headers: headers
      end
    end
  end
end
