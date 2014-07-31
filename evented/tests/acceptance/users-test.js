import Ember from 'ember';
import startApp from '../helpers/start-app';

var App, users, server;

module('Acceptance: Users', {
  setup: function() {
    App = startApp();

    users = {
      users: [
        {
          id: 1,
          first_name: "Kyle",
          last_name: "Davis"
        },
        {
          id: 2,
          first_name: "Wayne",
          last_name: "Statham"
        }
      ]
    };

    server = new Pretender(function(){
      this.get('/api/users', function(){
        return [200, {"Content-Type":"application/json"},JSON.stringify(users)];
      });
    });

  },
  teardown: function() {
    // Ember.run(App, 'destroy');
  }
});

test('visiting /users', function() {
  visit('/users');

  andThen(function() {
    equal(currentPath(), 'users.index');
  });
});

test('edit user', function(){
  var errors = {
    errors: {
      "first_name": ["you must do"]
    }
  }

  server.put('/api/users/1', function(r){
    return [422, {"Content-Type":"application/json"}, JSON.stringify(errors)];
  });

  visit('/users/1/edit').then(function(){
    fillIn('.spec-fn','');
  }).then(function(){
    ok(find('.v-errors').length, "Found the errors");
  }).then(function(){
    fillIn('.spec-fn','Klaus');
  }).then(function(){
    equal(find('.v-errors').length, 0, "Errors are gone");
    click('.spec-submit');
  }).then(function(){
    ok(1);
  })
});

test('a user shouldnt be able to save when one or more of the fields is invalid', function(){
  visit("/users/1/edit").then(function(){
    fillIn('.spec-fn', "")
  }).then(function(){
    ok(find('.spec-submit').attr("disabled"), "Button is disabled")
  })
});