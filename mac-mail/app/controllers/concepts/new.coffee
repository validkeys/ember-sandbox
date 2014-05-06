ConceptsNewController = Ember.ObjectController.extend

  newTitle:         ''
  newDescription:   ''

  cantSubmit:(->
    Ember.isEmpty(@get('newTitle')) || Ember.isEmpty(@get('newDescription'))
  ).property('newTitle','newDescription')
  
  actions:
    createConcept: ->
      unless @get('cantSubmit')
        newConcept = @store.createRecord 'concept',
          title:       @get('newTitle')
          description: @get('newDescription')
          bucket:      @get('bucket')

        console.log newConcept

        newConcept.save().then =>
          console.log newConcept
          @set 'newTitle',        ''
          @set 'newDescription',  ''
          @transitionToRoute 'concepts', @get('bucket')
          newConcept



`export default ConceptsNewController;`