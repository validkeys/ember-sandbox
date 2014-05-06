Router = Ember.Router.extend
  location: 'auto'

Router.map(->
  @resource 'buckets', path: '/', ->
    @route 'new', path: '/new'
)

`export default Router;`