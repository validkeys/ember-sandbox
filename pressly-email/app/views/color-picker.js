import Ember from 'ember';

export default Ember.TextField.extend({
  attributeBindings: ["name"],
  didInsertElement: function(){
    var _this = this;
    return this.$().minicolors({
      change: function(hex, opacity){
        return _this.set("value", hex);
      }
    });
  }
});
