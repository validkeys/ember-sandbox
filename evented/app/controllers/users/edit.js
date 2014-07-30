import Ember from 'ember';

export default Ember.ObjectController.extend({

  invalidationTest: function() {
    if (this.get('model.isValid')){
      console.log("My model became valid by observing the isValid property on the model");
    } else {
      console.log("My model became invalid by observing the isValid property on the model");
    }
  }.observes('model.isValid'),

  // validations:{
  //   first_name: {
  //     presence: {
  //       message: "Please enter a first name"
  //     }
  //   }
  // }  

});
