RoutineController = ($scope, $routeParams, routineService) ->
  routineService.get $routeParams.id, (routine) ->
    console.log(routine.sets())
    $scope.routine = routine

RoutineController.$inject = ['$scope','$routeParams','routineService']
angular.module('YoungCoconut::Routines').controller 'RoutineController', RoutineController
