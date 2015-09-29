module Api
  module V1
    class RoutinesController < ApplicationController
      def index
        routines = Routine.all
        render json: JSONAPI::Serializer.serialize(routines, is_collection: true, include: params[:include])
      end

      def show
        routine = Routine.find(params[:id])
        render json: JSONAPI::Serializer.serialize(routine, is_collection: false, include: ['routine_sets'])
      end
    end
  end
end
