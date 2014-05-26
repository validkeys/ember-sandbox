BuildsIndexRoute = Ember.Route.extend

  redirect: ->
    @transitionTo 'builds.build', 'a'

`export default BuildsIndexRoute;`    
