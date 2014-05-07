ConceptIndexRoute = Ember.Route.extend
  model: ( params ) ->
    @modelFor('concept').get('posts')

  renderTemplate: (controller) ->
    @render 'posts',
      into: 'concept'

`export default ConceptIndexRoute;`