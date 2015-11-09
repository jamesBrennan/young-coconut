routineListController = ($scope, routineService) ->
  routineService.query {}, (routines) ->
    $scope.routines = routines

  $scope.routineUrl = (routine) ->
    "#/routines/#{routine.id}"

routineListController.$inject = ['$scope','routineService']
angular.module('YoungCoconut::Routines').controller 'RoutineListController', routineListController
