require_relative 'request_error'

module Errors
  class ResourceConflict < RequestError
    def status
      409
    end
  end
end
