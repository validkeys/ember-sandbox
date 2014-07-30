import Ember from 'ember';

export default Ember.Route.extend({
  model: function(params){
    return this.store.find('user', params.user_id);
  },

  actions:{
    edit: function(){
      this.currentModel.save().then(function(){
        
      }, function(error){
        console.log(error);
      });
    }
  }
});
