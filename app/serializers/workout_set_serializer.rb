class WorkoutSetSerializer < BaseSerializer
  attribute :id
  attribute :metrics do
    # TODO: migrate metrics to a json column. This is dangerous.
    if object.metrics
      eval(object.metrics)
    end
  end

  has_one :workout
  has_one :routine_set
  has_one :exercise
end
