BucketsNewController = Ember.ObjectController.extend
  
  newTitle: ''

  actions:
    createBucket: ->
      
      if Ember.isEmpty(@get('newTitle'))
        alert 'Bucket name can\'t be blank!' 
      else
        newBucket = @store.createRecord 'bucket',
          title: @get('newTitle')

        newBucket.save().then =>
          @transitionToRoute 'buckets'

        @set 'newTitle', ''

`export default BucketsNewController;`