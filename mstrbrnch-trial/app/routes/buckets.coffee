BucketsRoute = Ember.Route.extend
  model: ( params ) ->
    @modelFor('project').get('buckets')

`export default BucketsRoute;`