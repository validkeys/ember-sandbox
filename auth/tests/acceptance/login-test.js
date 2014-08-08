import Ember from 'ember';
import startApp from '../helpers/start-app';

var App;

module('Acceptance: Login', {
  setup: function() {
    App = startApp();
  },
  teardown: function() {
    // Ember.run(App, 'destroy');
  }
});

test('visiting /login', function() {
  visit('/login');
  andThen(function() {
    equal(currentPath(), 'login');
    fillIn('#identification',"validkeys@gmail.com");
    fillIn('#password',"12345abc");
  }).then(function(){
    click('.login-button');
  });
});

