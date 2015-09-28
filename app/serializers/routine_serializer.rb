class RoutineSerializer < BaseSerializer
  attribute :id
  attribute :name

  has_many :routine_sets
end
