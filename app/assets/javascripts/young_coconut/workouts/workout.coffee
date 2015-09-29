workoutFactory = ($resource, resourceDefaults) ->
  API_URL = '/api/v1/workouts/:id.json'
  $resource API_URL, {id: '@id'}, resourceDefaults.methods

workoutFactory.$inject = ['$resource', 'resourceDefaults']
angular.module('YoungCoconut::Workout').factory 'Workout', workoutFactory
