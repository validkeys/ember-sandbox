ConceptsNewController = Ember.ObjectController.extend

  newTitle:         ''
  newDescription:   ''

  cantSubmit:(->
    Ember.isEmpty(@get('newTitle')) || Ember.isEmpty(@get('newDescription'))
  ).property('newTitle','newDescription')
  
  actions:
    createConcept: ->
      unless @get('cantSubmit')

        bucket = @get('bucket')

        newConcept = @store.createRecord 'concept',
          title:       @get('newTitle')
          description: @get('newDescription')
          bucket:      bucket


        newConcept.save().then =>
          bucket.get('concepts').pushObject newConcept

          @setProperties newTitle: '', newDescription: ''
          
          @transitionToRoute 'concepts', bucket



`export default ConceptsNewController;`