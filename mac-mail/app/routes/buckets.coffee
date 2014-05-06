BucketsRoute = Ember.Route.extend
  model: ->
    @store.find 'bucket'

`export default BucketsRoute;`    