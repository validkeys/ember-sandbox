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

`export default TodosController;`