routineListController = (routineService) ->
  console.log('routineList')
  @routines = routineService.query {}, (routines) ->
    console.log('routines', routines)

routineListController.$inject = ['routineService']
angular.module('YoungCoconut::Routines').controller 'RoutineListController', routineListController
