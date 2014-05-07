ProjectsNewController = Ember.ObjectController.extend
  
  newTitle: ''

  actions:
    createProject: ->

      newProject = @store.createRecord 'project',
        title: @get('newTitle')

      newProject.save().then =>
        @transitionToRoute 'projects'

`export default ProjectsNewController;`