workoutService = (Workout, userService) ->
  new: ->
    new Workout()

workoutService.$inject = ['Workout', 'userService']
angular.module('YoungCoconut::Workout').service 'workoutService', workoutService
