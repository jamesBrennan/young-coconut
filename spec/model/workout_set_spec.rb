require 'active_record_helper'
require 'support/factory_girl'

describe WorkoutSet do
  let(:attrs) { {} }
  subject(:workout_set) { described_class.new(attrs) }

  describe 'exercise' do
    let(:routine_set) { create :routine_set }
    let(:attrs) { { routine_set: routine_set } }
    before { workout_set.save! }

    subject { workout_set.exercise }

    it { should be_a Exercise }
    it { should eq routine_set.exercise }
  end

  describe 'last_time' do
    let(:workout) { create :workout }
    let(:routine_set) { create :routine_set, routine: workout.routine }

    let(:this_set_last_time) {
      create :workout_set,
             routine_set: routine_set,
             created_at: 2.days.ago,
             metrics: "{reps: 12, weight: 20}"
    }

    let(:this_set) {
      described_class.new routine_set: routine_set
    }

    subject(:last_time) { this_set.last_time }

    it { should eq this_set_last_time }
  end
end
