PostRoute = Ember.Route.extend

  model: (params) ->
    @store.find('post',params.post_id)

  # set this stuff up on the setupController
  # instead of the model because the model hook
  # is not called in the transition to when the model
  # is already passed
  setupController: (controller, model) ->

    labeledItems = model.get('labeled_items')
    labels = @store.find('label')

    Ember.RSVP.all([labeledItems, labels]).then (vals) ->

      controller.set 'labeled_items', vals[0]
      controller.set 'model',  model
      controller.set 'labels', vals[1]


`export default PostRoute;`
