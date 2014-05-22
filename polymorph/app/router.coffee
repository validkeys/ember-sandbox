Router = Ember.Router.extend
  location: ENV.locationType

Router.map ->
  @resource 'posts', path: "/posts", ->
    @resource 'post', path: "/:post_id", ->
      @route "comments", path: "/comments"

  @resource 'concepts', path: "/concepts", ->
    @resource 'concept', path: "/:concept_id", ->
      @route "comments", path: "/comments"

`export default Router;`
