import Ember from 'ember';
import Resolver from 'ember/resolver';
import loadInitializers from 'ember/load-initializers';

Ember.MODEL_FACTORY_INJECTIONS = true;

var App = Ember.Application.extend({
  modulePrefix: 'auth', // TODO: loaded via config
  Resolver: Resolver
});

Ember.RSVP.configure('onerror', function(e){
  console.error(e);
});

loadInitializers(App, 'auth');

export default App;
