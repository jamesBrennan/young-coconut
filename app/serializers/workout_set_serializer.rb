class WorkoutSetSerializer < BaseSerializer
  attribute :id
  has_one :workout
  has_one :routine_set
end
