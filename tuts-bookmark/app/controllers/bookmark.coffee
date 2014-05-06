BookmarkController = Ember.ObjectController.extend
  
  isFavorite:( (key, value) ->
    if value == undefined
      @get('favorite')
    else
      model = @get('model')
      model.set 'favorite', value
      model.save()
  ).property('favorite')

`export default BookmarkController;`