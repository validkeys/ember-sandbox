EditTodoView = Ember.TextField.extend
  didInsertElement: ->
    @$().focus()

`export default EditTodoView;`