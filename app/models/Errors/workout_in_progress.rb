require_relative 'resource_conflict'

module Errors
  class WorkoutInProgress < ResourceConflict
    attr_reader :workout
    delegate :detail, to: :workout

    def initialize(attrs)
      @workout = attrs[:workout]
      super
    end

    def meta
      { conflicting_resource: workout }
    end
  end
end
