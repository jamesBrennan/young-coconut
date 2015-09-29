class RoutineSetSerializer < BaseSerializer
  attribute :id
  attribute :instructions
  attribute :exercise_id

  has_one :exercise
end
