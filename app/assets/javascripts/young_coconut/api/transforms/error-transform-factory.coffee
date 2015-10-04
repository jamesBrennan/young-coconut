ErrorTransform = (JSONAPIErrorTransform, Status409Transform, Status422Transform) ->
  (response) ->
    error = JSONAPIErrorTransform(response)
    switch error.status
      when 409 then Status409Transform(error)
      when 422 then Status422Transform(error)
      else error

ErrorTransform.$inject = ['JSONAPIErrorTransform', 'Status409Transform', 'Status422Transform']
angular.module('YoungCoconut::Api').service 'ErrorTransform', ErrorTransform
