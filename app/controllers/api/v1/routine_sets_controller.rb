module Api
  module V1
    class RoutineSetsController < ApplicationController
      def index
        routine_sets = RoutineSet.where(routine_id: params[:routine_id])
        render json: JSONAPI::Serializer.serialize(routine_sets, is_collection: true, include: 'exercise')
      end

      def show
        routine_set = RoutineSet.find(params[:id])
        render json: JSONAPI::Serializer.serialize(routine_set, is_collection: false, include: 'exercise')
      end
    end
  end
end
