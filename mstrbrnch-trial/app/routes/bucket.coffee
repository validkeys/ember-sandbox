BucketRoute = Ember.Route.extend
  model: ( params ) ->
    if params.bucket_id is "default"
      project = @modelFor('project')
      project.get('defaultBucket').then (bucket) =>
        @transitionTo 'concepts', project, bucket
    else
      @store.find 'bucket', params.bucket_id


`export default BucketRoute;`