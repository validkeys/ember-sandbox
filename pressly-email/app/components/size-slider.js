import Ember from 'ember';

export default Ember.Component.extend({
  tagName:    "article",
  classNames: ["no-include","nstSlider"],

  attributeBindings: ["dataRangeMin:data-range_min","dataRangeMax:data-range_max","dataCurMin:data-cur_min","dataCurMax:data-cur_max"],

  dataRangeMin: 0,
  dataRangeMax: 600,
  dataCurMin: 10,
  dataCurMax: 590,  

  logoUrl: null,
  width: 600,

  onLogoChange: function(){
    return this.$().nstSlider('set_position', this.get("width"));
  }.observes("logoUrl","width"),

  didInsertElement: function(){
    var _this = this;
    this.$().nstSlider({
      "left_grip_selector": ".leftGrip",
      "value_bar_selector": ".bar",
      "value_changed_callback": function(cause, leftValue, rightValue){
        return _this.set("width", leftValue);
      }
    });
  },

  willDestroyElement: function(){
    return this.$().nstSlider('teardown');
  }
});
