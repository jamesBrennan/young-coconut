#= require_self
#= require_tree .

api = angular.module('YoungCoconut::Api', [])

api.config(["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])
