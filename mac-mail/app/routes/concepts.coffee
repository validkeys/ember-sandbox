ConceptsRoute = Ember.Route.extend
  renderTemplate: (controller) ->
    @render 'concepts',
      into:       'buckets'
      outlet:     'email-listing'
      controller: controller

`export default ConceptsRoute;`