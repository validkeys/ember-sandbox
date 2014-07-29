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
  visit('/users/1/edit').then(function(){
    fillIn('.spec-fn','')
  }).then(function(){
    // ...
  })
});
