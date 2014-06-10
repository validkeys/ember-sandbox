ConceptCreateRoute = Ember.Route.extend
  
  setupController: ( controller, model ) ->
    controller.set('model',   model)
    
    project = @modelFor('project')
    controller.set 'project', project

    # controller.set 'defaultBucket', project.get('defaultBucket')
    project.get('defaultBucket').then (bucket) -> 
      console.log bucket
      controller.set('defaultBucket', bucket)

  renderTemplate: ->
    # this, while a nested route
    # should render into it's full-screen page
    @render 'project.concepts.create',
      into: 'application'

`export default ConceptCreateRoute`