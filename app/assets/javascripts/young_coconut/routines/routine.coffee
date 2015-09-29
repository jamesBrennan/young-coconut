routineFactory = ($resource, $http) ->
  API_URL = '/api/v1/routines/:id.json'

  appendTransform = (defaults, transform) ->
    defaults = if angular.isArray(defaults) then defaults else [defaults]
    defaults.concat(transform);

  responseInterceptor = (config) ->
    console.log(config)
    config.resource.data

  responseErrorInterceptor = (rejection) ->
    console.warn('error', rejection)
    rejection

  transformResponse = (value) ->
    console.log(value)
    value

  $resource API_URL, {id: '@id'}, {
    query:
      method: 'GET'
      isArray: false,
      transformResponse: appendTransform($http.defaults.transformResponse, transformResponse)
      interceptor:
        response: responseInterceptor
        responseError: responseErrorInterceptor
  }

routineFactory.$inject = ['$resource', '$http']
angular.module('YoungCoconut::Routines').factory 'Routine', routineFactory
