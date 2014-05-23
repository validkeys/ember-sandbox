ConceptController = Ember.ObjectController.extend

  newComment: "A New Comment"

  actions:
    save: ->
      store = @get('store')

      window.deb = {
        model: @get('model')
      }

      console.log "Current Model:", @get('model')

      newComment = store.createRecord 'comment',
        title:       @get('newComment')

      # newComment.set 'commentable', @get('model')

      @get('model.comments').then (comments) ->
        comments.pushObject newComment


  # comments: Ember.computed.alias('model.comments')

`export default ConceptController;`
