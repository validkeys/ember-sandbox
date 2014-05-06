Router = Ember.Router.extend
  location: 'auto'

Router.map(->
  @resource 'bookmarks', path: '/', ->
    @route 'new', path: '/new'
)

`export default Router;`
