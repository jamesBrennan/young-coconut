Status422Transform = ->
  (error) ->
    error.errors = error.meta.errors
    delete error.meta
    error

angular.module('YoungCoconut::Api').service 'Status422Transform', Status422Transform
