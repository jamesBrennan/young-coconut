require 'rails_helper'

RSpec.shared_examples "check for workout in progress" do
  before do
    @workout = Workout.create
    allow(@workout).to receive(:detail).and_return('detail')
    allow(controller).to receive(:workout_in_progress).and_return(@workout)
  end

  it 'returns with the status code 409 (conflict)' do
    expect(response.status).to eq 409
  end

  it 'has a response body' do
    expect(response.body).to be_present
  end

  it 'includes the conflicting workout' do
    body = JSON.parse(response.body)
    expect(body["error"]["meta"]["conflicting_resource"]).not_to be_nil
  end
end

module Api
  module V1
    describe WorkoutsController do
      describe 'new' do
        context 'when a user does not have any workouts in progress' do
          it 'succeeds' do
            get :new
            expect(response.status).to eq 200
          end
        end

        context 'when a user has a workout in progress' do
          before do
            @workout = Workout.create
            allow(@workout).to receive(:detail).and_return('detail')
            allow(controller).to receive(:workout_in_progress).and_return(@workout)
            get :new
          end
          include_examples "check for workout in progress"
        end
      end

      describe 'create' do
        let(:routine) { Routine.create(name: "Test Routine") }
        let(:params) {{
          "data" => {
            "type" => 'workouts',
            "relationships" => {
              "routine" => {
                "data" => {
                  "type" => "routines",
                  "id" => routine.id
                }
              }
            }
          }
        }}

        before { routine }

        it 'creates a workout' do
          expect {
            post :create, params
          }.to change(Workout, :count).by 1
        end

        it 'returns a 201 response status' do
          post :create, params
          expect(response.status).to eql 201
        end

        it 'associates the new workout with the given routine' do
          post :create, params
          workout = Workout.last
          expect(workout.routine).to eq routine
        end

        context "when a user has a workout in progress" do
          before do
            @workout = Workout.create
            allow(@workout).to receive(:detail).and_return('detail')
            allow(controller).to receive(:workout_in_progress).and_return(@workout)
            post :create, params
          end
          include_examples "check for workout in progress"
        end
      end
    end
  end
end
