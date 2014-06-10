MenusGlobalController = Ember.ObjectController.extend
  
  projects: []

  init: ->
    @_super()
    @set 'projects', @get('store').find('project')

`export default MenusGlobalController`