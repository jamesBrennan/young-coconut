#= require ./routines/module

dependencies = [
  'ngRoute'
  'YoungCoconut::Routines'
]

YoungCoconut = angular.module('YoungCoconut', dependencies)
YoungCoconut.config(['$routeProvider', ($routeProvider) ->
  $routeProvider
    .otherwise
      redirectTo: '/workouts/new'
]);
