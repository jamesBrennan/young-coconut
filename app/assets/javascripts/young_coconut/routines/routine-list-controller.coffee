routineListController = ($scope, routineService) ->
  routineService.query({}, (routines) ->
    $scope.routines = routines
  )

routineListController.$inject = ['$scope','routineService']
angular.module('YoungCoconut::Routines').controller 'RoutineListController', routineListController
