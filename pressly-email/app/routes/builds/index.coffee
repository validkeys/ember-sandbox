BuildIndexRoute = Ember.Route.extend

  redirect: ->
    @transitionTo 'builds.build', 'a'

`export default BuildIndexRoute;`
