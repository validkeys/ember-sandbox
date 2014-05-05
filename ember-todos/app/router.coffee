Router = Ember.Router.extend
  location: 'auto'

Router.map(->
  @resource 'todos', path: '/', ->
    @route 'active',    path: '/active'
    @route 'completed', path: '/completed'
)

`export default Router;`
