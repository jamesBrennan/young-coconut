require_relative 'workout_conflict'

module Errors
  class WorkoutInProgress < WorkoutConflict
  end
end
