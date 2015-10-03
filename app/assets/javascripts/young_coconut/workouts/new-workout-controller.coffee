NewWorkoutController = ($scope, workoutService, routineService) ->
  workoutService.new (workout) ->
    $scope.workout = workout
  , (response) ->
    console.error(response)

  routineService.query {}, (routines) ->
    $scope.routine = routines.first
    $scope.routines = routines

  $scope.startWorkout = ->
    workoutService.create $scope.workout, (workout) ->
      console.log(arguments)
      console.log(workout)

NewWorkoutController.$inject = ['$scope','workoutService','routineService']
angular.module('YoungCoconut::Workouts').controller 'NewWorkoutController', NewWorkoutController
