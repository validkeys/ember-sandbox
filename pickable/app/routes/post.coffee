PostRoute = Ember.Route.extend

  model: (params) ->
    Ember.RSVP.hash
      post: @store.find 'post', params.post_id
      labels: @store.find 'label'

  setupController: (controller, model) ->
    controller.set 'model', model.post
    controller.set 'labels', model.labels

`export default PostRoute;`
