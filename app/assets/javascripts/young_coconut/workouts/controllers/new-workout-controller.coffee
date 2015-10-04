NewWorkoutController = ($, $location, workouts, routines, routes) ->
  redirectTo = (id) ->
    $location.path routes.nextWorkoutSetPath(workout_id: id)

  workouts.new (workout) ->
    $.workout = workout
  , (error) ->
    switch error.status
      when 409 then redirectTo(error.conflicting_resource.id)

  routines.query {}, (routines) ->
    $.routine = routines.first
    $.routines = routines

  $.startWorkout = ->
    workouts.create $.workout, (workout) ->
      redirectTo workout.id

NewWorkoutController.$inject = ['$scope','$location','workoutService','routineService','workoutRouteHelper']
angular.module('YoungCoconut::Workouts').controller 'NewWorkoutController', NewWorkoutController
