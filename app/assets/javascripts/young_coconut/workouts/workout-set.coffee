workoutSetFactory = ($resource, resourceDefaults) ->
  API_URL = '/api/v1/workouts/:workout_id/workout_sets/:id.json'

  methods = $.extend(true, {}, resourceDefaults.methods)
  methods.save.transformRequest = (data, headersGetter) ->
    out = data:
      type: 'workout-sets'
      attributes:
        metrics: data.metrics
      relationships:
        routine_set:
          data:
            type: 'routine-sets'
            id: data['routine-set'].id
    JSON.stringify(out)

  $resource API_URL, {workout_id: '@workout_id', id: '@id'}, methods

workoutSetFactory.$inject = ['$resource', 'resourceDefaults']
angular.module('YoungCoconut::Workouts').factory 'WorkoutSet', workoutSetFactory
