Route = ->
  (name, path_map, opts = {}) ->
    {template, controller} = opts

    name: name
    templateUrl: "assets/#{template}-template.html"
    controller: controller
    path: (urlParams = {}) ->
      path_map.replace /\:[^\/]+/, (match) -> urlParams[match]

angular.module('YoungCoconut::Routes').factory 'Route', Route
