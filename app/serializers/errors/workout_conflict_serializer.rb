module Errors
  class WorkoutConflictSerializer < RequestErrorSerializer
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
        # override
      end
    end
  end
end
