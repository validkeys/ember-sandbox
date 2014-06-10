IndexRoute = Ember.Route.extend
  redirect: -> 
    @transitionTo 'projects'

`export default IndexRoute`
