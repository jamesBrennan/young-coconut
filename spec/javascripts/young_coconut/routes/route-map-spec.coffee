describe 'RouteMap', ->
  beforeEach module 'YoungCoconut::Routes'

  describe 'resource', ->
    beforeEach inject (RouteMap) ->
      @map = RouteMap "workouts", ->
        @resource "workout"

    it 'creates default routes', ->
      route_names = (route.name for route in @map.routes())
      console.log(route_names)
      for action in ['workout','new_workout','show_workout']
        expect(action in route_names).toBeTruthy()
