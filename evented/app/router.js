import Ember from 'ember';

var Router = Ember.Router.extend({
  location: EventedENV.locationType
});

Router.map(function() {
  this.resource('users', {path: '/users'}, function(){
    this.route('edit', {path: '/:user_id/edit'});
  });
  this.route('users/edit');
});

export default Router;
