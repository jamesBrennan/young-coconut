WorkoutSetController = ($scope, $params, $window, $location, workouts, routes) ->
  workouts.get id: $params.workout_id, include: 'routine', (workout) ->
    $scope.workout = workout

  onSuccess = (workoutSet) ->
    $scope.workoutSet   = workoutSet
    $scope.exercise     = workoutSet.exercise
    $scope.instructions = workoutSet['routine-set'].instructions

  loadNextSet = ->
    workouts.get id: $params.workout_id, include: 'routine', (workout) ->
      $scope.workout = workout

    workouts.nextSet $params.workout_id, onSuccess, (response) ->
      $location.path routes.showWorkoutPath(id: response.conflicting_resource.id)

  loadRequestedSet = ->
    workouts.getSet($params, onSuccess)

  switch $params.id
    when 'next' then loadNextSet()
    else loadRequestedSet()

  $scope.setAction = (action) ->
    $scope.action = action

  $scope.saveReps = (reps) ->
    $scope.reps = reps
    $scope.action = if $scope.weight then 'review' else 'input-weight'

  $scope.resetReps = ->
    delete $scope.reps
    $scope.action = 'input-reps'

  $scope.saveWeight = (weight) ->
    $scope.weight = weight
    $scope.action = 'review'

  $scope.resetWeight = ->
    delete $scope.weight
    $scope.action = 'input-weight'

  $scope.save = ->
    $scope.workoutSet.metrics =
      reps: $scope.reps,
      weight: $scope.weight

    workouts.saveSet $params.workout_id, $scope.workoutSet, ->
      $scope.resetWeight()
      $scope.resetReps()
      loadNextSet()
    , (response) ->
      console.log(response)

  $scope.repRange = [1..20]
  $scope.weightRange = (weight for weight in [5..100] by 2.5)

WorkoutSetController.$inject = ['$scope','$routeParams','$window','$location','workoutService','workoutRouteHelper']
angular.module('YoungCoconut::Workouts').controller 'WorkoutSetController', WorkoutSetController
