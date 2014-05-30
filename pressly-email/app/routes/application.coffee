ApplicationRoute = Ember.Route.extend

  actions:
    showHtml: (html) ->
      @controllerFor('application').set('showingHtml', true)
      # @controllerFor('htmloutput').set('html', html)
      @render 'htmloutput',
        into:       'application'
        outlet:     'html'
        controller: 'htmloutput'

    closeModal: ->
      @controllerFor('application').set('showingHtml', false)

`export default ApplicationRoute`
