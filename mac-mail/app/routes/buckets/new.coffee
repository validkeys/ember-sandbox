BucketNewRoute = Ember.Route.extend
  renderTemplate: (controller) ->
    @render 'buckets.new',
      into:   'buckets'
      outlet: 'new-bucket-form'

`export default BucketNewRoute;`