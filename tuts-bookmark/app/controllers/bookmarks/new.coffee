BookmarksNewController = Ember.ObjectController.extend
  
  newTitle: ''
  newURL:   ''

  actions:
    createBookmark: ->

      newBookmark = @store.createRecord 'bookmark',
        title:    @get('newTitle')
        url:      @get('newURL')
        favorite: false

      newBookmark.save().then =>
        @transitionToRoute 'bookmarks'

        @set 'newTitle',  ''
        @set 'newURL',    ''

`export default BookmarksNewController`