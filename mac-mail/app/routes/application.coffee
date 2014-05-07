ApplicationRoute = Ember.Route.extend
  model: ->
    @store.find 'project'

`export default ApplicationRoute`    