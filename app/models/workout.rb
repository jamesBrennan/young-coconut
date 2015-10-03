class Workout < ActiveRecord::Base
  belongs_to :user
  belongs_to :routine
  has_many :workout_sets

  validates :user, presence: true
  validates :routine, presence: true

  def self.for_user(user)
    where(user: user)
  end

  def self.in_progress
    where(completed: nil)
  end

  def detail
    template = "%s was started on %s. <br> %s of %s sets have been completed."
    values = [routine.name, created_at.to_s(:short), workout_sets.count, routine.routine_sets.count]
    template % values
  end
end
