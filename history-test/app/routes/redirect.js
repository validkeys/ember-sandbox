export default Ember.Route.extend({
  afterModel: function(){
    this.replaceWith('contact')
  }
});
