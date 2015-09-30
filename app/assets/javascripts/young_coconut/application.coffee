#= require ./routines/module
#= require ./workouts/module

dependencies = [
  'ngRoute'
  'YoungCoconut::Routines'
  'YoungCoconut::Workouts'
]

YoungCoconut = angular.module('YoungCoconut', dependencies)
YoungCoconut.config(['$routeProvider', ($routeProvider) ->
  $routeProvider
    .otherwise
      redirectTo: '/workouts/new'
]);
