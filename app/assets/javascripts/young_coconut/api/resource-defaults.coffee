resourceDefaults = (JSONAPIIncludesTransform) ->
  interceptor =
    response: (config) ->
      JSONAPIIncludesTransform(config.resource)
    responseError: (rejection) ->
      rejection

  interceptor: interceptor
  methods:
    get:
      method: 'GET'
      isArray: false
      interceptor: interceptor
    query:
      method: 'GET'
      isArray: false,
      interceptor: interceptor

angular.module('YoungCoconut::Api').service 'resourceDefaults', resourceDefaults
