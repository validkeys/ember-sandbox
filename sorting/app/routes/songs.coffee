SongsRoute = Ember.Route.extend

  model: ->
    @store.find 'song'

`export default SongsRoute;`
