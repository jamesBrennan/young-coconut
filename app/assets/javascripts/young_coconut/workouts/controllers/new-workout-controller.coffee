NewWorkoutController = ($scope, $location, workoutService, routineService) ->
  conflictId = (response) ->
    conflict = response.data.error.meta.conflicting_resource
    conflict.data.id

  redirectToConflicting = (response) ->
    path = "/workouts/#{conflictId(response)}/workout_sets/next"
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
      console.log(arguments)
      console.log(workout)

NewWorkoutController.$inject = ['$scope','$location','workoutService','routineService']
angular.module('YoungCoconut::Workouts').controller 'NewWorkoutController', NewWorkoutController
