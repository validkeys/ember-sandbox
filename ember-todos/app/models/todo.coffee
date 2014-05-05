Todo = DS.Model.extend
  title:      DS.attr('string')
  isCompleted: DS.attr('boolean')

Todo.reopenClass
  FIXTURES: [
    id:         1
    title:      "First Todo",
    isCompleted: false
  ]

`export default Todo`