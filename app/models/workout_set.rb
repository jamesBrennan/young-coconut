class WorkoutSet < ActiveRecord::Base
  belongs_to :workout
  belongs_to :routine_set

  has_one :exercise, through: :routine_set
  delegate :instructions, to: :routine_set

  def last_time
    WorkoutSet
      .where(routine_set: routine_set)
      .order(created_at: :desc)
      .first
  end
end
