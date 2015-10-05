class WorkoutSerializer < BaseSerializer
  attribute :id
  attribute :updated_at
  attribute :total_sets
  attribute :completed_sets

  has_one :user
  has_one :routine

  has_many :workout_sets
end
