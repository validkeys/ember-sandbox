ConceptsRoute = Ember.Route.extend
  model: ( params ) ->
    @modelFor('bucket').get('concepts')

`export default ConceptsRoute;`