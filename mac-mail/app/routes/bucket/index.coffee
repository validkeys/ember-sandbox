BucketIndexRoute = Ember.Route.extend
  model: ( params ) ->
    console.log "\n----------------"
    console.debug @modelFor('project')
    console.log @modelFor('bucket').get('attributes')
    console.log "\n----------------\n"
    @modelFor('bucket').get('concepts')

  renderTemplate: (controller) ->
    @render 'concepts',
      into:       'buckets'
      outlet:     'email-listing'
      controller: controller

`export default BucketIndexRoute;`