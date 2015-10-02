require 'active_record_helper'
require_relative '../../app/models/workout'

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
end
