BucketRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'bucket', params.bucket_id

`export default BucketRoute;`