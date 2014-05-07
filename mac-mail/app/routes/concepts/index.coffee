ConceptsIndexRoute = Ember.Route.extend
  
  renderTemplate: (controller) ->
    @render 'concepts.index',
      into: 'concepts'

`export default ConceptsIndexRoute;`