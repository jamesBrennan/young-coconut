WorkoutSetController = ($, $params, $window, $location, workouts, routes) ->
  workouts.get id: $params.workout_id, include: 'routine', (workout) ->
    $.workout = workout

  onSuccess = (workoutSet) ->
    $.workoutSet   = workoutSet
    $.exercise     = workoutSet.exercise
    $.instructions = workoutSet['routine-set'].instructions

  loadNextSet = ->
    workouts.get id: $params.workout_id, include: 'routine', (workout) ->
      $.workout = workout

    workouts.nextSet $params.workout_id, onSuccess, (response) ->
      $location.path routes.showWorkoutPath(id: response.conflicting_resource.id)

  loadRequestedSet = ->
    workouts.getSet($params, onSuccess)

  switch $params.id
    when 'next' then loadNextSet()
    else loadRequestedSet()

  $.setAction = (action) ->
    $.action = action

  $.saveReps = (reps) ->
    $.reps = reps
    $.action = if $.weight then 'review' else 'input-weight'

  $.resetReps = ->
    delete $.reps
    $.action = 'input-reps'

  $.saveWeight = (weight) ->
    $.weight = weight
    $.action = 'review'

  $.resetWeight = ->
    delete $.weight
    $.action = 'input-weight'

  $.save = ->
    $.workoutSet.metrics =
      reps: $.reps,
      weight: $.weight

    workouts.saveSet $params.workout_id, $.workoutSet, ->
      $.resetWeight()
      $.resetReps()
      loadNextSet()
    , (response) ->
      console.log(response)

  $.repRange = [1..20]
  $.weightRange = (weight for weight in [5..100] by 2.5)

WorkoutSetController.$inject = ['$scope','$routeParams','$window','$location','workoutService','workoutRouteHelper']
angular.module('YoungCoconut::Workouts').controller 'WorkoutSetController', WorkoutSetController
