ConceptController = Ember.ObjectController.extend

  newComment: "A New Comment"

  actions:
    save: ->
      store = @get('store')
      newComment = store.createRecord 'comment',
        title: @get('newComment')

      newComment.set 'commentable', @get('model')

      @get('model.comments').then (comments) ->
        comments.pushObject newComment


  # comments: Ember.computed.alias('model.comments')

`export default ConceptController;`
