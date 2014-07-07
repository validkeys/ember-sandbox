`import Ember from 'ember';`

Router = Ember.Router.extend
  location: PresslyEmailENV.locationType

Router.map ->
  @resource 'layouts', path: '/layouts', ->
    @resource 'builds', path: '/build', ->
      @route 'build', path: '/:template_letter'


`export default Router;`
