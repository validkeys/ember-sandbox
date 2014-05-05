Router = Ember.Router.extend
  location: 'auto'

Router.map(->
  @resource 'todos', path: '/'
)

`export default Router;`
