class RoutineSetSerializer < BaseSerializer
  attribute :id
  attribute :instructions
  has_one :exercise
end
