require_relative '../../app/models/routine_set'

FactoryGirl.define do
  factory :routine_set do
    routine
    exercise
    instructions '10-15 reps'
  end
end
