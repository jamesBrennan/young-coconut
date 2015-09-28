class WorkoutSet < ActiveRecord::Base
  belongs_to :workout
  belongs_to :routine_set
end
