class WorkoutSetSerializer < BaseSerializer
  attribute :id
  attribute :metrics

  has_one :workout
  has_one :routine_set
  has_one :exercise
end
