import Ember from 'ember';
import DS from 'ember-data';

export default DS.Model.extend({
  firstName: DS.attr('string'),
  lastName: DS.attr('string'),
  

  name: function(){
    return this.get('firstName') + " " + this.get('lastName');
  }.property('firstName','lastName')
});
