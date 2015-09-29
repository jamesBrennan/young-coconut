routineFactory = ($resource, JSONAPIIncludesTransform) ->
  API_URL = '/api/v1/routines/:id.json'

  responseInterceptor = (config) ->
    JSONAPIIncludesTransform(config.resource)

  responseErrorInterceptor = (rejection) ->
    rejection

  $resource API_URL, {id: '@id'},
    query:
      method: 'GET'
      isArray: false,
      interceptor:
        response: responseInterceptor
        responseError: responseErrorInterceptor

routineFactory.$inject = ['$resource', 'JSONAPIIncludesTransform']
angular.module('YoungCoconut::Routines').factory 'Routine', routineFactory
