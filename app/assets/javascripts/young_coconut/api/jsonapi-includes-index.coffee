JSONAPIIndexFactory = ->
  buildIndex = (included) ->
    includedIndex = {}
    for model in included
      includedIndex[model.type] ||= []
      includedIndex[model.type][Number(model.id)] = model
    includedIndex

  (included) ->
    index = buildIndex(included)

    get: ({type, id}) ->
      ofType = index[type]
      return null unless ofType
      return (obj for obj in ofType when obj) unless id
      index[type][Number(id)]

angular.module('YoungCoconut::Api').factory 'JSONAPIIncludesIndex', JSONAPIIndexFactory
