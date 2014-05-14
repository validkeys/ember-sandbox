var Router = Ember.Router.extend({
  location: ENV.locationType
});

Router.map(function() {
  this.route('about');
  this.route('redirect');
  this.route('contact');
});

export default Router;
