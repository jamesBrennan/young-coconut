resourceDefaults = (JSONAPIIncludesTransform, ErrorTransform) ->
  interceptor =
    response: (config) ->
      JSONAPIIncludesTransform(config.resource)

  interceptor: interceptor
  methods:
    get:
      method: 'GET'
      isArray: false
      interceptor: interceptor
    query:
      method: 'GET'
      isArray: false
      interceptor: interceptor
    save:
      method: 'POST'
      interceptor: interceptor

resourceDefaults.$inject = ['JSONAPIIncludesTransform', 'ErrorTransform']
angular.module('YoungCoconut::Api').service 'resourceDefaults', resourceDefaults
