routeHelper = ->
  routes = {
    new: '/workouts/new',
    show: '/workouts/:id',
    showWorkoutSet: '/workouts/:workout_id/workout_sets/:id'
    nextWorkoutSet: '/workouts/:workout_id/workout_sets/next'
  }

  pathParams = (path, params = {}) ->
    path.replace /\:[^\/]+/, (key) ->
      params[key.replace(':','')]

  newWorkoutPath: -> routes.new
  showWorkoutPath: (params) -> pathParams(routes.show, params)
  showWorkoutSetPath: (params) -> pathParams(routes.showWorkoutSet, params)
  nextWorkoutSetPath: (params) -> pathParams(routes.nextWorkoutSet, params)

angular.module('YoungCoconut::Workouts').service 'workoutRouteHelper', routeHelper
