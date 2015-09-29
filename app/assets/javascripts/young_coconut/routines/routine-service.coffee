routineService = (Routine) ->
  query: (q = {}, success = (->), failure = (->)) ->
    params = $.extend({include: 'routine-sets'}, q)
    Routine.query(params, success, failure)

routineService.$inject = ['Routine']
angular.module('YoungCoconut::Routines').service 'routineService', routineService
