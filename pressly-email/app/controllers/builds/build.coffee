BuildsBuildController = Ember.ObjectController.extend
  needs: ['builds']
  utmsAlias: Ember.computed.alias('controllers.builds.utmString')
  fontColor: Ember.computed.alias('controllers.builds.fontColor')

`export default BuildsBuildController;`
