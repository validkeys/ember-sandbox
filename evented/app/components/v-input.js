import Ember from 'ember';

export default Ember.Component.extend({

  // init: function(){
  //   this._super();
  //   // this.set('errors',[]);
  // },
  ctrlr: null,
  model:  Ember.computed.alias('ctrlr.model'),
  name:   "",

  serverValidationErrors: function(){
    var key = "model.errors." + this.get('name');
    return _.map(this.get(key), function(err){
      return err.message;
    });
  }.property('name','model.errors.[]'),


  errorMessages: function(){
    var serverMessages = this.get('serverValidationErrors');
    return serverMessages.concat(this.get('localErrors'));
  }.property('name','serverValidationErrors.[]','localErrors.[]'),


  localErrors: [],
  updateErrors: function() {
    this.set('localErrors', _.map(this.get('ctrlr.errors.' + this.get('name')), function(err){
      return err;
    }));
  },

  didInsertElement: function(){
    this.addObserver("ctrlr.errors." + this.get('name'), this.updateErrors);
  }

  // willDestroyElement: function(){
  //   this.removeObserver("model.errors." + this.get('name'), this.updateErrors);
  // }
});
