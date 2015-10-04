JSONAPIIncludesTransform = (JSONAPIIncludesIndex) ->
  collapseAttributes = (model) ->
    return unless model
    model[k] = v for k,v of model.attributes
    delete model.attributes
    model

  expandRelationship = (model, relationName, relationData, index) ->
    if Array.isArray relationData
      model[relationName] = []
      for params in relationData
        model[relationName].push hydrateModel(index.get(params), index)
    else if relationData
      model[relationName] = hydrateModel(index.get(relationData), index)
    model

  hydrateModel = (model, index = new ResourceIndex([])) ->
    return null unless model
    for relName, relData of model.relationships
      unless relName == 'self'
        expandRelationship(model, relName, relData.data, index)
    delete model.relationships
    collapseAttributes(model)

  (response) ->
    index = new JSONAPIIncludesIndex(response.included || [])

    if Array.isArray response.data
      hydrateModel(model, index) for model in response.data
    else
      hydrateModel(response.data, index)

    response.data || response

JSONAPIIncludesTransform.$inject = ['JSONAPIIncludesIndex']
angular.module('YoungCoconut::Api').service 'JSONAPIIncludesTransform', JSONAPIIncludesTransform
