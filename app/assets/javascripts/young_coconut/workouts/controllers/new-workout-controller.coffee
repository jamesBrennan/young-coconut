NewWorkoutController = ($scope, $location, workoutService, routineService) ->
  nextWorkoutSetPath = (workout_id) ->
    "/workouts/#{workout_id}/workout_sets/next"

  redirectTo = (id) ->
    $location.path nextWorkoutSetPath(id)

  workoutService.new (workout) ->
    $scope.workout = workout
  , (error) ->
    switch error.status
      when 409 then redirectTo(error.conflicting_resource.id)

  routineService.query {}, (routines) ->
    $scope.routine = routines.first
    $scope.routines = routines

  $scope.startWorkout = ->
    workoutService.create $scope.workout, (workout) ->
      redirectTo workout.id

NewWorkoutController.$inject = ['$scope','$location','workoutService','routineService']
angular.module('YoungCoconut::Workouts').controller 'NewWorkoutController', NewWorkoutController
