`import Resolver from 'ember/resolver';`
`import loadInitializers from 'ember/load-initializers';`

Ember.MODEL_FACTORY_INJECTIONS = true

App = Ember.Application.extend
  modulePrefix: 'mac-mail' # TODO: loaded via config
  Resolver:     Resolver

loadInitializers(App, 'mac-mail')

`export default App;`
