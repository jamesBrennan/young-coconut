NewWorkoutController = ($scope, workoutService, routineService) ->
  $scope.workout = workoutService.new()
  routineService.query {}, (routines) ->
    $scope.routines = routines

NewWorkoutController.$inject = ['$scope','workoutService', 'routineService']
angular.module('YoungCoconut::Api').controller 'NewWorkoutController'
