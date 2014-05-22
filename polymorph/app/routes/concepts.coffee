ConceptsRoute = Ember.Route.extend

  model: ->
    @store.find 'concept'

`export default ConceptsRoute;`    
