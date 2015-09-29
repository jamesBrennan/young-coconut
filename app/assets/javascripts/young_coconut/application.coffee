#= require ./routines/module

dependencies = [
  'ngRoute'
  'YoungCoconut::Routines'
]

YoungCoconut = angular.module('YoungCoconut', dependencies)
YoungCoconut.config(['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when '/routines',
      templateUrl: 'assets/routine-list-template.html'
      controller: 'RoutineListController'
    .otherwise
      redirectTo: '/routines'
]);

YoungCoconut.run(['$rootScope', ($rootScope) ->
  $rootScope.$on '$routeChangeStart', (event, next, current) ->
    console.log(event, next, current)
])
