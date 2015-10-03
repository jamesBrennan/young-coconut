require 'active_record_helper'
require 'support/factory_girl'

describe Workout do
  describe 'validation' do
    let(:attributes) { {} }
    subject(:workout) { described_class.new(attributes) }
    before { workout.valid? }

    describe 'user relationship' do
      subject(:user_errors) { workout.errors[:user] }

      it 'is required' do
        expect(user_errors).to be_present
      end
    end

    describe 'routine relationship' do
      subject(:routine_errors) { workout.errors[:routine] }

      it 'is required' do
        expect(routine_errors).to be_present
      end
    end
  end

  describe 'next_set' do
    let(:routine) { create :routine }
    let!(:routine_sets) {[
      create(:routine_set, order: 1, routine: routine),
      create(:routine_set, order: 2, routine: routine),
      create(:routine_set, order: 3, routine: routine)
    ]}

    let(:workout) { create :workout, routine: routine }
    subject(:next_set) { workout.next_set }

    it 'returns a new workout_set' do
      expect(next_set).to be_a WorkoutSet
    end

    it 'returns the first routine set' do
      expect(next_set.routine_set.order).to eq 1
    end

    context 'when some workout_sets have been completed' do
      before do
        workout.workout_sets.create routine_set: routine_sets.first
      end

      it 'returns a workout set for the first un-started routine set' do
        expect(next_set.routine_set.order).to eq 2
      end
    end

    context 'when all workout_sets have been completed' do
      before do
        workout.routine_sets.each do |routine_set|
          workout.workout_sets.create routine_set: routine_set
        end
      end

      it 'returns nil' do
        expect(next_set).to be_nil
      end
    end
  end
end
