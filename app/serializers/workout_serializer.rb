class WorkoutSerializer < BaseSerializer
  attribute :id

  has_one :user
  has_one :routine
end
