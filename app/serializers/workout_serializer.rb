class WorkoutSerializer < BaseSerializer
  attribute :id
  attribute :total_sets
  attribute :completed_sets

  has_one :user
  has_one :routine
end
