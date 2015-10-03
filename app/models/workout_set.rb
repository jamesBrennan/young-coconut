class WorkoutSet < ActiveRecord::Base
  belongs_to :workout
  belongs_to :routine_set

  has_one :exercise, through: :routine_set
  delegate :instructions, to: :routine_set
end
