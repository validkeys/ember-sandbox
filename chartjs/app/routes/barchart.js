import Ember from 'ember';

export default Ember.Route.extend({

  model: function(){

    var modelData = [
      Ember.Object.create().setProperties({date: "2014-08-01", count: 100}),
      Ember.Object.create().setProperties({date: "2014-08-02", count: 150}),
      Ember.Object.create().setProperties({date: "2014-08-03", count: 200})
    ];

    return Ember.ArrayProxy.create({
      content: Ember.A(modelData)
    });
  },

  afterModel: function(){
    var _this = this;
    Ember.run.later(_this, function(){
      console.log("Adding Model");
      this.currentModel.pushObject(Ember.Object.create().setProperties({date: "2014-08-04", count: Math.floor((Math.random() * 1000) + 100)}));
    }, 2500);
  }

});