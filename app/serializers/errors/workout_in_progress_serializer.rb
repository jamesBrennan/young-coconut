module Errors
  class WorkoutInProgressSerializer < RequestErrorSerializer
    class << self
      private

      def error_hash(error)
        hash          = error.to_h
        hash[:title]  = title
        hash[:meta]   = meta(error.workout)
        hash
      end

      def meta(workout)
        { conflicting_resource: JSONAPI::Serializer.serialize(workout, is_collection: false) }
      end

      def title
        I18n.t 'api.errors.workout_in_progress.title'
      end
    end
  end
end
