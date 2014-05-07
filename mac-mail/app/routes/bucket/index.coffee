BucketIndexRoute = Ember.Route.extend
  model: (params) ->
    @modelFor('bucket').get('concepts')

  renderTemplate: (controller) ->
    @render 'concepts',
      into:   'buckets'
      outlet: 'email-listing'

`export default BucketIndexRoute;`