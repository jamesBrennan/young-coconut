require_relative '../../app/models/workout'

FactoryGirl.define do
  factory :workout do
    routine
    user
  end
end
