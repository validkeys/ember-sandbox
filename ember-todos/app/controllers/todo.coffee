TodoController = Ember.ObjectController.extend

  isEditing: false
  
  isCompleted:( (key, value) ->
    model = @get('model')
    console.log "FIRING", key, value
    if value == undefined
      model.get('isCompleted')
    else
      model.set('isCompleted', value)
      model.save()
      value
  ).property('model.isCompleted')

  actions:
    editTodo: -> 
      @toggleProperty('isEditing')
      false

    removeTodo: ->
      model = @get('model')
      model.deleteRecord()
      model.save()
    
    acceptChanges: ->
      if Ember.isEmpty(@get('model.title'))
        @send 'removeTodo'
      else
        model = @get('model')
        model.save()
        @set('isEditing', false)
      false

`export default TodoController;`