workoutService = (Workout, WorkoutSet, ErrorTransform) ->
  wrappedErrorHandler = (callback = (->)) ->
    (response) -> callback(ErrorTransform(response))

  new: (success = (->), error = (->)) ->
    Workout.get {id: 'new'}, success, wrappedErrorHandler(error)

  get: (params, success = (->), error = (->)) ->
    Workout.get params, success, wrappedErrorHandler(error)

  create: (attrs, success = (->), error = (->)) ->
    Workout.save {}, attrs, success, wrappedErrorHandler(error)

  saveSet: (workoutId, attrs, success = (->), error = (->)) ->
    params = { workout_id: workoutId }
    WorkoutSet.save params, attrs, success, wrappedErrorHandler(error)

  nextSet: (workoutId, success = (->), error = (->)) ->
    params = { workout_id: workoutId, id: 'new', include: 'workout,exercise,routine-set' }
    WorkoutSet.get params, success, wrappedErrorHandler(error)

workoutService.$inject = ['Workout','WorkoutSet','ErrorTransform']
angular.module('YoungCoconut::Workouts').service 'workoutService', workoutService
