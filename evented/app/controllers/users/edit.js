import Ember from 'ember';

export default Ember.ObjectController.extend( Ember.Validations.Mixin, {

  validations: {
    firstName: {
      presence: {
        message: "Hello MOTO"
      }
    },
    lastName: {
      presence: true
    }
  }


});
