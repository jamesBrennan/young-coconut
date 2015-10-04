workoutSetFactory = ($resource, resourceDefaults) ->
  API_URL = '/api/v1/workouts/:workout_id/workout_sets/:id.json'

  methods = resourceDefaults.methods
  Workout = $resource API_URL, {workout_id: '@workout_id', id: '@id'}, methods

workoutSetFactory.$inject = ['$resource', 'resourceDefaults']
angular.module('YoungCoconut::Workouts').factory 'WorkoutSet', workoutSetFactory
