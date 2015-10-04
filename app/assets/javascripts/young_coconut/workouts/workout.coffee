workoutFactory = ($resource, resourceDefaults) ->
  API_URL = '/api/v1/workouts/:id.json'

  jsonApiFormat = (data, headersGetter) ->
    out =
      data:
        type: 'workouts'
        relationships:
          routine:
            data:
              type: 'routines'
              id: data.routine.id
          user:
            data:
              type: 'users'
              id: data.user.id
    JSON.stringify(out)

  methods = $.extend(true, {}, resourceDefaults.methods)
  methods.save.transformRequest = jsonApiFormat

  $resource API_URL, {id: '@id'}, methods

workoutFactory.$inject = ['$resource', 'resourceDefaults']
angular.module('YoungCoconut::Workouts').factory 'Workout', workoutFactory
