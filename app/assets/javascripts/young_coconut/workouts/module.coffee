#= require ../api/module
#= require_self
#= require_tree .

dependencies = [
  'ngResource'
  'ngRoute'
  'YoungCoconut::Api'
  'YoungCoconut::Routines'
]

workouts = angular.module('YoungCoconut::Workouts', dependencies)
workouts.config(['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when '/workouts/new',
      templateUrl: 'assets/workout-new-template.html'
      controller: 'NewWorkoutController'
    .when '/workouts/:id',
      templateUrl: 'assets/workout-template.html'
      controller: 'WorkoutController'
    .when '/workouts/:workout_id/workout_sets/:id',
      templateUrl: 'assets/workout-set-template.html'
      controller: 'WorkoutSetController'
]);
