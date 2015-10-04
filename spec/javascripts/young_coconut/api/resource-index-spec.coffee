describe 'JSONAPIIndexFactory Factory', ->
  beforeEach module 'YoungCoconut::Api'

  beforeEach ->
    @chest = {type: 'routines',  id: '1', attributes: {name: 'Chest Workout'}}
    @legs  = {type: 'routines',  id: '2', attributes: {name: 'Leg Workout'}}
    @set_1 = {type: 'routine_sets', id: '1', attributes: {instructions: '10-15 reps'}}
    @set_2 = {type: 'routine_sets', id: '2', attributes: {name: '10 reps or to failure'}}

    @includes = [@chest, @legs, @set_1, @set_2]

  describe 'constructor', ->
    it 'returns a queryable index', inject (JSONAPIIncludesIndex) ->
      resourceIndex = new JSONAPIIncludesIndex(@includes)
      expect(resourceIndex.get({type: 'routines', id: 1})).toEqual @chest

  describe 'querying the index', ->
    beforeEach inject (JSONAPIIncludesIndex) ->
      @index = new JSONAPIIncludesIndex(@includes)

    describe 'with a type that does not exist in the index', ->
      it 'returns null', ->
        result = @index.get {type: 'unknown-type'}
        expect(result).toBeNull()

    describe 'with only a type', ->
      it 'returns an array of resources of that type', ->
        result = @index.get {type: 'routines'}
        expect(result).toEqual [@chest, @legs]

    describe 'with only an id', ->
      it 'returns null', ->
        result = @index.get {id: '1'}
        expect(result).toBeNull()

    describe 'with a type and id', ->
      it 'returns the matching object', ->
        result = @index.get {type: 'routines', id: 2}
        expect(result).toEqual @legs
