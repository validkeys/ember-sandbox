BuildsBuildController = Ember.ObjectController.extend
  needs: ['builds']
  utmsAlias: Ember.computed.alias('controllers.builds.utmString')

`export default BuildsBuildController;`
