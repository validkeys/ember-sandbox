IndexRoute = Ember.Route.extend

  beforeModel: ->
    @transitionTo "layouts"

`export default IndexRoute;`
