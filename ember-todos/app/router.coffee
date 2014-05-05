Router = Ember.Router.extend
  location: 'auto'

Router.map(->
  @resource 'todos'
);

`export default Router;`
