PostsNewRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set('concept', @modelFor('concept'))

`export default PostsNewRoute;`