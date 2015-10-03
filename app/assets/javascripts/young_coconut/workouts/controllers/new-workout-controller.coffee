NewWorkoutController = ($scope, $location, workoutService, routineService) ->
  conflictId = (response) ->
    conflict = response.data.error.meta.conflicting_resource
    conflict.data.id

  redirectToConflicting = (response) ->
    path = "/workouts/#{conflictId(response)}"
    $location.path path

  workoutService.new (workout) ->
    console.log('ok')
    $scope.workout = workout
  , (response) ->
    console.log(response.status)
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
