ProjectConceptsCreateController = Ember.ObjectController.extend

  newTitle: ''
  newBody:  ''

  project:        null
  defaultBucket:  null
  
  actions:
    createConcept: ->
      title = @get('newTitle')
      return if !title.trim()

      concept = @store.createRecord 'concept',
        title:  title
        body:   @get('newBody')
        bucket: @get('defaultBucket')

      concept.save().then (data) =>
        @transitionToRoute 'concepts.index', @get('project'), @get('defaultBucket')

`export default ProjectConceptsCreateController`