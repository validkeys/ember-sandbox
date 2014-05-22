PostsNewController = Ember.ObjectController.extend

  newBody: ''

  cantSubmit:(->
    Ember.isEmpty(@get('newBody'))
  ).property('newBody')

  actions:
    createPost: ->

      concept = @get('concept')

      newPost = @store.createRecord 'post',
        concept: concept
        body:    @get('newBody')

      newPost.save().then =>

        @setProperties newBody: ''

        concept.get('posts').pushObject newPost
        @transitionToRoute 'posts'

`export default PostsNewController;`
