ConceptRoute = Ember.Route.extend

  model: (params) ->
    @store.find 'concept', params.concept_id
  
  setupController: (controller, model) ->
    controller.set 'model', model
    # controller.set 'posts', model.get('posts')

  renderTemplate: (controller) ->
    @render 'concept',
      into: 'concepts'

`export default ConceptRoute;`