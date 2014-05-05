IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo('todos')

`export default IndexRoute`