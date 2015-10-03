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
end
