require 'spec_helper'
require 'ostruct'
require_relative '../../../app/models/errors/workout_in_progress'

module Errors
  describe WorkoutInProgress do
    let(:stub_detail) { 'workout detail' }
    let(:workout) { OpenStruct.new(id: 1, detail: stub_detail) }

    subject(:wip_error) { described_class.new workout: workout }

    its(:status) { should eq 409 }
    its(:code) { should eq 'WorkoutInProgress' }
    its(:detail) { should eq stub_detail }
    its(:meta) { should eq(conflicting_resource: workout) }
  end
end
