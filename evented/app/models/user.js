import Ember from 'ember';
import DS from 'ember-data';

export default DS.Model.extend( Ember.Validations.Mixin, {
  first_name: DS.attr('string'),
  last_name: DS.attr('string'),

  name: function(){
    return this.get('first_name') + " " + this.get('last_name');
  }.property('first_name','last_name'),

  validations:{
    first_name: {
      presence: {
        message: "Please enter a first name"
      }
    }
  }
});
