HtmloutputController = Ember.ObjectController.extend

  needs: 'builds'

  builds: Ember.computed.alias('controllers.builds')

  html: ''

  monitorHtml:(->
    @set 'html', @get('controllers.builds.html')
  ).observes('controllers.builds.html').on('init')

`export default HtmloutputController;`
