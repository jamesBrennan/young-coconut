WorkoutSetController = ($scope, $routeParams, workoutService) ->
  workoutService.get id: $routeParams.workout_id, include: 'routine', (workout) ->
    $scope.workout = workout

  onSuccess = (workoutSet) ->
    $scope.workoutSet   = workoutSet
    $scope.exercise     = workoutSet.exercise
    $scope.instructions = workoutSet['routine-set'].instructions

  loadNextSet = ->
    workoutService.nextSet($routeParams.workout_id, onSuccess)

  loadRequestedSet = ->
    workoutService.getSet($routeParams, onSuccess)

  switch $routeParams.id
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

  $scope.repRange = [1..20]
  $scope.weightRange = (weight for weight in [5..100] by 2.5)

WorkoutSetController.$inject = ['$scope','$routeParams','workoutService']
angular.module('YoungCoconut::Workouts').controller 'WorkoutSetController', WorkoutSetController
