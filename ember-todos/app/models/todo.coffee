Todo = DS.Model.extend
  title:    DS.attr('string')
  complete: DS.attr('boolean')

Todo.reopenClass
  FIXTURES: [
    id:       1
    title:    "First Todo",
    complete: false
  ]

`export default Todo`