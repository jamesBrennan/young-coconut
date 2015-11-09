module Api
  module V1
    class WorkoutSetsController < ApiController
      def index
        workout_sets = WorkoutSet.where(workout_id: params[:workout_id])
        serialize workout_sets, list: true, include: params[:include]
      end

      def new
        workout = Workout.find(params[:workout_id])
        workout_set = workout.next_set
        if workout_set
          serialize workout_set, include: params[:include]
        else
          serialize_error Errors::WorkoutComplete.new workout: workout
        end
      end

      def create
        attrs = {workout_id: params[:workout_id]}.merge(create_params)
        workout_set = WorkoutSet.new(attrs)
        if workout_set.save
          url = api_v1_workout_workout_set_url(workout_id: params[:workout_id], id: workout_set.id)
          serialize workout_set, status: 201, headers: { "Location" => url }
        else
          serialize_error Errors::ValidationError.new(resource: workout_set)
        end
      end

      def show
        workout_set = WorkoutSet.find(params[:id])
        render json: JSONAPI::Serializer.serialize(workout_set, is_collection: false)
      end

      private

      def workout_set_params
        attributes = [{ metrics: [:reps, :weight] }]
        relationships = [{ routine_set: { data: :id } }]
        params.require(:data).permit attributes: attributes, relationships: relationships
      end

      def relationship_params
        workout_set_params[:relationships]
      end

      def relationship(name)
        (relationship_params[name] && relationship_params[name][:data]) || {}
      end

      def attr_param(name)
        workout_set_params[:attributes] && workout_set_params[:attributes][name]
      end

      def create_params
        { metrics: attr_param(:metrics), routine_set_id: relationship(:routine_set)[:id] }
      end
    end
  end
end
