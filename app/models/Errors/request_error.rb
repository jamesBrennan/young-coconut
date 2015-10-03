require 'active_support/core_ext/string/conversions'

module Errors
  class RequestError
    ATTRS = [:status, :title, :detail, :meta, :code]
    attr_reader *ATTRS

    def initialize(attrs)
      @status = attrs[:status]
      @title  = attrs[:title]
      @detail = attrs[:detail]
      @meta   = attrs[:meta]
    end

    def code
      self.class.name.demodulize
    end

    def to_h
      ATTRS.each_with_object({}) { |attr, hash| hash[attr] = send(attr) }
    end
  end
end
