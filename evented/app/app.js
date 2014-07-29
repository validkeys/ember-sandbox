import Ember from 'ember';
import Resolver from 'ember/resolver';
import loadInitializers from 'ember/load-initializers';

Ember.MODEL_FACTORY_INJECTIONS = true;

Ember.RSVP.configure('onerror', function(e){
  console.error("--------- RSVP ERROR ----------");
  console.error(e.statusText);
  console.error(e.message);
  console.error(e.stack);
  console.error(e);
  console.error("-------------------------------");
});

var App = Ember.Application.extend({
  modulePrefix: 'evented', // TODO: loaded via config
  Resolver: Resolver
});

loadInitializers(App, 'evented');

export default App;
