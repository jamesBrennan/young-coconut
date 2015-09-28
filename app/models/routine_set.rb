class RoutineSet < ActiveRecord::Base
  belongs_to :routine
  belongs_to :exercise
  has_many :workout_sets
end
