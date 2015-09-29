routineFactory = ($resource, resourceDefaults) ->
  API_URL = '/api/v1/routines/:id.json'
  $resource API_URL, {id: '@id'}, resourceDefaults.methods

routineFactory.$inject = ['$resource', 'resourceDefaults']
angular.module('YoungCoconut::Routines').factory 'Routine', routineFactory
