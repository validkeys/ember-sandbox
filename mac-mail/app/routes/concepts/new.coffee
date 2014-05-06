ConceptNewRoute = Ember.Route.extend

  setupController: (controller, model) ->
    controller.set('model', model)
    controller.set('bucket', @modelFor('bucket'))

  renderTemplate: (controller) ->
    @render 'concepts.new',
      into:       'concepts'
      outlet:     'new-concept'
      controller: controller



`export default ConceptNewRoute;`