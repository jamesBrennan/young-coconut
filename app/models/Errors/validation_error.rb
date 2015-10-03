module Errors
  class ValidationError < RequestError
    attr_reader :resource

    def initialize(attrs)
      @resource = attrs[:resource]
      super
    end

    def status
      422
    end
  end
end
