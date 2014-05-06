BookmarksRoute = Ember.Route.extend
  model: ->
    @store.find('bookmark')

`export default BookmarksRoute;`