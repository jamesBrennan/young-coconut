class Workout < ActiveRecord::Base
  belongs_to :user
  belongs_to :routine

  has_many :routine_sets, through: :routine
  has_many :workout_sets, dependent: :destroy

  validates :user, presence: true
  validates :routine, presence: true

  def self.for_user(user)
    where(user: user)
  end

  def self.in_progress
    where(completed: nil)
  end

  def current_set
    next_set = routine_sets
                  .where.not(id: completed_routine_set_ids)
                  .order(order: :asc)
                  .first

    workout_sets.build(routine_set: next_set)
  end

  def completed_routine_set_ids
    workout_sets.pluck(:routine_set_id)
  end

  def detail
    template = "%s was started on %s. <br> %s of %s sets have been completed."
    values = [routine.name, created_at.to_s(:short), workout_sets.count, routine.routine_sets.count]
    template % values
  end
end
