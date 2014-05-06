Router = Ember.Router.extend
  location: 'auto'

Router.map(->
  @resource 'buckets', path: '/buckets', ->
    @route('new', path: '/new')
    @resource 'bucket', path: '/:bucket_id', ->
      @resource 'concepts', path: '/concepts', ->
        @resource 'concept', path: '/:concept_id', ->
          @resource 'posts', path: '/posts', ->
            @route 'new', path: '/new'
        @route 'new', path: '/new'
      # ...
)

`export default Router;`