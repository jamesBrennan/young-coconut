JSONAPIErrorTransform = ->
  (response) ->
    response.data.error

angular.module('YoungCoconut::Api').service 'JSONAPIErrorTransform', JSONAPIErrorTransform
