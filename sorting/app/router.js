var Router = Ember.Router.extend({
  location: ENV.locationType
});

Router.map(function() {
  this.route("songs", {path: "/"});
});

export default Router;
