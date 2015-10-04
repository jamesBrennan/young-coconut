#= require ./routes/module
#= require ./routines/module
#= require ./workouts/module

dependencies = [
  'ngRoute'
  'YoungCoconut::Routes'
  'YoungCoconut::Routines'
  'YoungCoconut::Workouts'
]

YoungCoconut = angular.module('YoungCoconut', dependencies)
YoungCoconut.config(['$routeProvider', ($routeProvider) ->
  $routeProvider
    .otherwise
      redirectTo: '/workouts/new'
]);
