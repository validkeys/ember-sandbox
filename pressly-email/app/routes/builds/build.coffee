LayoutsBuildRoute = Ember.Route.extend

  model: (params) ->
    return {
      letter: params.template_letter
    }

  renderTemplate: (controller) ->
    @render "layouts/templates/#{controller.get('model.letter')}",
      controller: controller

`export default LayoutsBuildRoute;`
