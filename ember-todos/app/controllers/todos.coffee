TodosController = Ember.ArrayController.extend

  newTitle: ""

  actions:
    createTodo: ->
      newTodo = @store.createRecord('todo',
          title:        @get('newTitle')
          isCompleted:  false
        )

      newTodo.save().then =>
        @set 'newTitle', ''

    clearCompleted: ->
      completed = @filterBy 'isCompleted', true
      completed.invoke 'deleteRecord'
      completed.invoke 'save'

  num_incomplete:(->
    @filterBy('isCompleted', false).get('length')
  ).property('@each.isCompleted')

  num_complete:(->
    @filterBy('isCompleted', true).get('length')
  ).property('@each.isCompleted')

  inflection:(->
    if @get('num_incomplete') == 1 then "todo" else "todos"
  ).property('num_incomplete')
  
  isComplete:(->
    @get('complete')
  ).property('complete')

  allAreDone:( (key, value) ->
    # if this isnt running as a result
    # of being manually checked
    if value == undefined
      !!@get('length') && @everyProperty('isCompleted', true)
    else
      @setEach  'isCompleted', value
      @invoke   'save'
      value
  ).property('@each.isCompleted')

`export default TodosController;`