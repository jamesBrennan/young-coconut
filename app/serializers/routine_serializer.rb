class RoutineSerializer < BaseSerializer
  attribute :id
  attribute :name

  has_many :exercises
  has_many :routine_sets
end
