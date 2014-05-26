HtmloutputView = Ember.View.extend

  tagName: 'pre'

  classNames: 'highlight'

  html: Ember.computed.alias('controller.html')

  formattedHtml: ''

  # test:(->
  #   console.log "FOUND CHANGE IN HTML"
  # ).property('html')

  highlight:(->
    console.log "Highlight called in htmloutput view", @get('html')
    hljs.configure({useBR: true})
    unless Ember.isEmpty(@get('html'))
      @set('formattedHtml', hljs.highlight('xml', @get('html')).value)
  ).on('didInsertElement')

`export default HtmloutputView`
