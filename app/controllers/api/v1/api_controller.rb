module Api
  module V1
    class ApiController < ApplicationController
      private

      def serialize_error(error)
        serializer = "Errors::#{error.code}Serializer".constantize
        render json: serializer.serialize(error), status: error.status
      end

      def serialize(resource, opts = {})
        includes  = opts[:include]
        headers   = opts[:headers]
        status    = opts[:status] || 200
        list      = !!opts[:list]
        body      = JSONAPI::Serializer.serialize(resource, is_collection: list, include: includes)
        render json: body, status: status, headers: headers
      end
    end
  end
end

