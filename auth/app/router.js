import Ember from 'ember';

var Router = Ember.Router.extend({
  location: AuthENV.locationType
});

Router.map(function() {
  this.route('application');
  this.route('login');
  this.route('signup');
  this.route('protected');
});

export default Router;
