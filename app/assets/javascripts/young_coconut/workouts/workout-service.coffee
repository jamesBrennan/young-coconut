workoutService = (Workout, WorkoutSet) ->
  new: (success = (->), error = (->)) ->
    Workout.get {id: 'new'}, success, error

  get: (params, success = (->), error = (->)) ->
    Workout.get params, success, error

  create: (attrs) ->
    Workout.save {}, attrs

  nextSet: (workout_id, success = (->), error = (->)) ->
    params = { workout_id: workout_id, id: 'new', include: 'workout,exercise,routine-set' }
    WorkoutSet.get params, success, error

workoutService.$inject = ['Workout','WorkoutSet']
angular.module('YoungCoconut::Workouts').service 'workoutService', workoutService
