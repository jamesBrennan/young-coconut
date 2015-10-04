NewWorkoutController = ($scope, $location, workoutService, routineService) ->
  nextWorkoutSetPath = (workout_id) ->
    "/workouts/#{workout_id}/workout_sets/next"

  conflictId = (response) ->
    conflict = response.data.error.meta.conflicting_resource
    conflict.data.id

  redirectToConflicting = (response) ->
    path = nextWorkoutSetPath(conflictId response)
    $location.path path

  workoutService.new (workout) ->
    $scope.workout = workout
  , (response) ->
    switch response.status
      when 409 then redirectToConflicting(response)

  routineService.query {}, (routines) ->
    $scope.routine = routines.first
    $scope.routines = routines

  $scope.startWorkout = ->
    workoutService.create $scope.workout, (workout) ->
      console.log(workout: workout)
      $location.path nextWorkoutSetPath(workout.id)

NewWorkoutController.$inject = ['$scope','$location','workoutService','routineService']
angular.module('YoungCoconut::Workouts').controller 'NewWorkoutController', NewWorkoutController
