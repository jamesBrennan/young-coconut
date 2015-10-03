require 'active_support/core_ext/hash/slice'

module Errors
  class RequestErrorSerializer
    class << self
      def serialize(error)
        { error: error_hash(error) }.to_json
      end

      private

      def error_hash(error)
        error.to_h
      end
    end
  end
end
