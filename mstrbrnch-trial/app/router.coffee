Router = Ember.Router.extend
  location: 'auto'

Router.map(->
  @route 'projects'
  @resource 'project', path: 'projects/:project_id', ->
    @route 'concepts.create', path: '/concepts/create'
    @resource 'buckets', ->
      @resource 'bucket', path: '/:bucket_id', ->
        @resource 'concepts', path: '/concepts', ->
          @resource 'concept', path: '/:concept_id'
)

`export default Router`
