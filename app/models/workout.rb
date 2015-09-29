class Workout < ActiveRecord::Base
  belongs_to :user
  belongs_to :routine
  has_many :workout_sets

  def self.for_user(user)
    where(user: user)
  end

  def self.in_progress
    where(completed: false)
  end

  def detail
    template = "%s was started on %s. %s of %s sets have been completed."
    values = [routine.name, created_at.to_s(:short), workout_sets.count, routine.routine_sets.count]
    template % values
  end
end
