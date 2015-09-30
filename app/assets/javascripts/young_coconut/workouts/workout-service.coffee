workoutService = (Workout) ->
  new: (success = (->), error = (->)) ->
    Workout.get({id: 'new'}, success, error)

  create: (attrs) ->
    Workout.save({}, attrs)

workoutService.$inject = ['Workout']
angular.module('YoungCoconut::Workouts').service 'workoutService', workoutService
