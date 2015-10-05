WorkoutController = ($scope, $routeParams, workoutService) ->
  params = $.extend({}, $routeParams, {include: 'routine,workout-sets'})

  workoutService.get params, (workout) ->
    $scope.workout = workout

  workoutService.allSets $routeParams.id, (sets) ->
    for set in sets
      console.log(set.metrics)
    $scope.sets = sets

WorkoutController.$inject = ['$scope','$routeParams','workoutService']
angular.module('YoungCoconut::Workouts').controller 'WorkoutController', WorkoutController
