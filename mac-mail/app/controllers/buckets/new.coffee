BucketsNewController = Ember.ObjectController.extend
  
  newTitle: ''

  actions:
    createBucket: ->
      
      newBucket = @store.createRecord 'bucket',
        title: @get('newTitle')

      newBucket.save().then =>
        @transitionToRoute 'buckets'

      @set 'newTitle', ''

`export default BucketsNewController;`