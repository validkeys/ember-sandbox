Router = Ember.Router.extend
  location: 'auto'

Router.map(->
  @resource 'buckets', path: '/buckets', ->
    @route('new', path: '/new')
    @resource 'bucket', path: '/:bucket_id', ->
      @resource 'concepts', path: '/concepts'
      # ...
)

`export default Router;`