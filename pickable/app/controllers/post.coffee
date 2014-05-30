PostController = Ember.ObjectController.extend

  selectedLabels:(->
    @get('labeled_items').map (item) ->
      item.get('label')
  ).property('labeled_items.@each')

  actions:
    pick: (label) ->

      console.log "Going to add #{label.get('title')}"

      newLabeledItem = @store.createRecord 'labeled_item',
        post: @get('model')
        label: label

      newLabeledItem.save().then =>
        @get('model.labeled_items').pushObject(newLabeledItem)


    unpick: (label) ->
      console.log "Going to remove #{label.get('title')}"

      labeledItem = @get('model.labeled_items').findBy('label', label)

      if labeledItem
        labeledItem.destroyRecord().then =>
          @get('model.labeled_items').removeObject labeledItem
      else
        console.error "Labeled item not found!"


`export default PostController;`
