import Ember from 'ember';

export default Ember.Component.extend({

  init: function(){
    this._super();
    this.set('errors',[]);
  },

  model:  {},
  name:   "",

  errors: [],

  updateErrors: function() {
    if (this.get('model.isValid')){
      return this.set('errors',[]);
    } else {
      var msgs = this.get('model.errors.' + this.get('name'));
      return this.set('errors', msgs);
    }
  },

  didInsertElement: function(){
    this.addObserver("model.errors." + this.get('name'), this.updateErrors);
  }
});
