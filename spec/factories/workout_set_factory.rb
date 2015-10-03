require_relative '../../app/models/workout_set'

FactoryGirl.define do
  factory :workout_set do
    workout
    routine_set
  end
end
