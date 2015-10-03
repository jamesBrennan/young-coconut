module Errors
  class ValidationErrorSerializer < RequestErrorSerializer
    class << self
      private

      def error_hash(error)
        hash          = error.to_h
        hash[:title]  = title(error.resource)
        hash[:meta]   = meta(error.resource)
        hash
      end

      def meta(resource)
        { validation_errors: resource.errors }
      end

      def title(resource)
        I18n.t 'api.errors.validation_error.title', resource: resource.class.name
      end
    end
  end
end
