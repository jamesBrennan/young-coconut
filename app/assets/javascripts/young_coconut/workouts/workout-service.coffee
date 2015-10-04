workoutService = (Workout, WorkoutSet) ->
  new: (success = (->), error = (->)) ->
    Workout.get {id: 'new'}, success, error

  get: (params, success = (->), error = (->)) ->
    Workout.get params, success, error

  create: (attrs, success = (->), error = (->)) ->
    Workout.save {}, attrs, success, error

  saveSet: (workoutId, attrs, success = (->), error = (->)) ->
    params = { workout_id: workoutId }
    WorkoutSet.save params, attrs, success, error

  nextSet: (workoutId, success = (->), error = (->)) ->
    params = { workout_id: workoutId, id: 'new', include: 'workout,exercise,routine-set' }
    WorkoutSet.get params, success, error

workoutService.$inject = ['Workout','WorkoutSet']
angular.module('YoungCoconut::Workouts').service 'workoutService', workoutService
