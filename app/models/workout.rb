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
    where(id: in_progress_ids)
  end

  def self.completed
    where(id: completed_ids)
  end

  def next_set
    set = next_routine_set
    return nil unless set
    workout_sets.build(routine_set: set)
  end

  def completed_routine_set_ids
    workout_sets.pluck(:routine_set_id)
  end

  def next_routine_set
    routine_sets
      .where.not(id: completed_routine_set_ids)
      .order(order: :asc)
      .first
  end

  def total_sets
    routine_sets.count
  end

  def completed_sets
    workout_sets.count
  end

  def detail
    template = "%s was started on %s. %s of %s sets have been completed."
    values = [routine.name, created_at.to_s(:short), workout_sets.count, routine.routine_sets.count]
    template % values
  end

  def completed
    @completed ||= Workout.completed_ids.pluck(:id).include? id
  end

  private

  def self.set_comparison(operator)
    "count(distinct(routine_sets.id)) #{operator} count(distinct(workout_sets.id))"
  end

  def self.in_progress_ids
    select_ids.having set_comparison(">")
  end

  def self.completed_ids
    select_ids.having set_comparison("=")
  end

  def self.select_ids
    select(:id)
      .joins(routine: :routine_sets)
      .joins("LEFT OUTER JOIN workout_sets ON workout_sets.workout_id = workouts.id")
      .group(:id)
  end
end
