var Router = Ember.Router.extend({
  location: ENV.locationType
});

Router.map(function() {
  this.resource('projects', {path: '/projects'}, function(){
    this.resource('project', {path: '/:project_id'});
    this.resource('phases', {path: '/:phase'});
  });
});

export default Router;
