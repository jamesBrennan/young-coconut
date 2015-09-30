NewWorkoutController = ($scope, workoutService, routineService) ->
  workoutService.new (workout) ->
    $scope.workout = workout

  routineService.query {}, (routines) ->
    $scope.routine = routines.first
    $scope.routines = routines

  $scope.startWorkout = ->
    workoutService.create($scope.workout)

NewWorkoutController.$inject = ['$scope','workoutService','routineService']
angular.module('YoungCoconut::Workouts').controller 'NewWorkoutController', NewWorkoutController
