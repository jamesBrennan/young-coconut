#  { "status":409,
#    "title":"A workout is already in progress. A new workout can not be started until the current workout is completed.",
#    "detail":"Break In A was started on 04 Oct 17:56. \u003cbr\u003e 0 of 16 sets have been completed.",
#    "code":"WorkoutInProgress",
#    "meta": {
#      "conflicting_resource": {
#        "data": { // serialized model here }
#      }
#    }
#  }

Status409Transform = (JSONAPIIncludesTransform)->
  (error) ->
    error.conflicting_resource = JSONAPIIncludesTransform(error.meta.conflicting_resource.data)
    delete error.meta
    error

Status409Transform.$inject = ['JSONAPIIncludesTransform']
angular.module('YoungCoconut::Api').service 'Status409Transform', Status409Transform
