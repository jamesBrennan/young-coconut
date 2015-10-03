WorkoutController = ($scope, $routeParams, workoutService) ->
  params = $.extend({}, $routeParams, {include: 'routine'})

  workoutService.get params, (workout) ->
    $scope.workout = workout

WorkoutController.$inject = ['$scope','$routeParams','workoutService']
angular.module('YoungCoconut::Workouts').controller 'WorkoutController', WorkoutController