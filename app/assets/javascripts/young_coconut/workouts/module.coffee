#= require ../api/module
#= require_self

dependencies = [
  'ngResource'
  'ngRoute'
  'YoungCoconut::Api'
  'YoungCoconut::Routine'
]

workouts = angular.module('YoungCoconut::Workouts', dependencies)
workouts.config(['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when '/workouts/new',
      templateUrl: 'assets/workout-new-template.html'
      controller: 'NewWorkoutController'
]);
