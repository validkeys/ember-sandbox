import Ember from 'ember';
import startApp from '../helpers/start-app';

var App;

module('Acceptance: Signup', {
  setup: function() {
    if(App){ App.reset();}
    App = startApp();
  },
  teardown: function() {
    // Ember.run(App, 'destroy');
  }
});

test('visiting /signup', function() {
  visit('/signup');

  andThen(function() {
    equal(currentPath(), 'signup');
  });
});

test("enter details and submit with success", function(){
  visit('/signup').then(function(){
      fillIn('#identification',"validkeys@gmail.com+" + Math.floor((Math.random() * 50) + 1));
      fillIn('#password',"12345abc");
      click('button.signupbutton');
  }).then(function(){
    ok(find('.logout-button').length, "Found the logout button");
    click('.logout-button');
  });
});
