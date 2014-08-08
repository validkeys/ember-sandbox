import Ember from 'ember';

export default Ember.Route.extend({

  model: function(){
    return this.store.createRecord('user');
  },

  actions: {
    createNewAccount: function(){
      var model    = this.currentModel,
      password = this.currentModel.get('password'),
      _this    = this;

      model.save().then(function(){
        return _this.get('session').authenticate('simple-auth-authenticator:oauth2-password-grant',{
          identification: model.get('email'),
          password:      password
        });
      },function(error){
        console.warn("ERROR!", error);
      })
    }
  }

});
