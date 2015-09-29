routineService = (Routine) ->
  query: (q = {}, success = (->), failure = (->)) ->
    params = $.extend({include: 'exercises'}, q)
    Routine.query(params, success, failure)

  get: (id, success = (->), failure = (->)) ->
    params = $.extend({include: 'routine-sets,exercises'}, {id: id})
    Routine.get(params, success, failure)

routineService.$inject = ['Routine']
angular.module('YoungCoconut::Routines').service 'routineService', routineService
