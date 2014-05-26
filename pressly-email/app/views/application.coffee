ApplicationView = Ember.View.extend

  showingHtml: Ember.computed.alias('controller.showingHtml')

  classNameBindings: ['showingHtml']

  classNames: ['full-height app-wrapper']

`export default ApplicationView;`
