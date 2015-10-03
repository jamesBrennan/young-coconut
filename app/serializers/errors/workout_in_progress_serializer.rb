module Errors
  class WorkoutInProgressSerializer < WorkoutConflictSerializer
    class << self
      private

      def title
        I18n.t 'api.errors.workout_in_progress.title'
      end
    end
  end
end
