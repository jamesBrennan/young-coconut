RouteMap = (Route) ->
  (prefix = "", mapDefinition = ->) ->
    routes = []
    default_actions = ['index', 'new', 'show']

    resourcePath = (action) ->
      switch action
        when 'index'  then prefix
        when 'new'    then [prefix,action].join('/')
        when 'show'   then [prefix,':id'].join('/')

    routeName = (name, action) ->
      switch action
        when 'index' then name
        else [action,'_',name].join("")

    @resource = (name, opts = {}) ->
      { only } = opts
      actions = if only then only else default_actions
      for action in actions
        rName = routeName(name, action)
        path = resourcePath(action)
        route = new Route(rName, path, template: rName)
        routes.push route

    mapDefinition.call(@)

    routes: -> routes

RouteMap.$inject = ['Route']
angular.module('YoungCoconut::Routes').factory 'RouteMap', RouteMap
