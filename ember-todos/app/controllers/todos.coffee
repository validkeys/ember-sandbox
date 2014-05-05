TodosController = Ember.ArrayController.extend
  
  isComplete:(->
    @get('complete')
  ).property('complete')

`export default TodosController;`