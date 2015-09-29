#= require ../api/module
#= require_self
#= require_tree .

dependencies = [
  'ngResource'
  'ngRoute'
  'YoungCoconut::Api'
]

routines = angular.module('YoungCoconut::Routines', dependencies)

routines.config(['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/routines',
        templateUrl: 'assets/routine-list-template.html'
        controller: 'RoutineListController'
      .when '/routines/:id',
        templateUrl: 'assets/routine-template.html'
        controller: 'RoutineController'
]);
