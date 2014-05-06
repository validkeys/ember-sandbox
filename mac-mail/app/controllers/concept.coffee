ConceptController = Ember.ObjectController.extend

  actions:
    removeConcept: ->
      if confirm('Really?')
        model = @get('model')
        model.deleteRecord()
        model.save()

`export default ConceptController;`