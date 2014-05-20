SongsNewController = Ember.ObjectController.extend

  newTitle:  ''
  newRating: 1

  actions:
    newSong: ->

      newSong = @store.createRecord 'song',
        title: @get('newTitle')
        rating: @get('newRating')

      newSong.save().then =>
        @setProperties
          newTitle: ''
          newRating: 1

`export default SongsNewController;`
