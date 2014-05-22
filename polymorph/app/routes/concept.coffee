ConceptRoute = Ember.Route.extend

  model: (params) ->
    @store.find 'concept', params.concept_id

`export default ConceptRoute;`
