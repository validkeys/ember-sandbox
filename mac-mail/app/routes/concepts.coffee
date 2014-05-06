ConceptsRoute = Ember.Route.extend
  model: ->
    @modelFor('bucket').get('concepts')

  setupController: (controller, model) ->
    controller.set('model', model)
    controller.set('bucket', @modelFor('bucket'))

  renderTemplate: (controller) ->
    @render 'concepts',
      into:       'buckets'
      outlet:     'email-listing'
      controller: controller

`export default ConceptsRoute;`