module Errors
  class WorkoutCompleteSerializer < WorkoutConflictSerializer
    class << self
      private

      def title
        I18n.t 'api.errors.workout_complete.title'
      end
    end
  end
end
