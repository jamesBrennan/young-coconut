module Api
  module V1
    class RoutinesController < ApplicationController
      def index
        routines = Routine.all
        render json: JSONAPI::Serializer.serialize(routines, is_collection: true)
      end
    end
  end
end
