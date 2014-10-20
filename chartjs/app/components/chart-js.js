import Ember from 'ember';

export default Ember.Component.extend({
  tagName:  "canvas",
  setup:    false,
  type:     "Bar",
  gridLines: true,

  defaultOptions: {
    responsive: true,
    bezierCurve: true,
    bezierCurveTension: 0.4,
    pointDot: true,
    animation: false
  },

  didInsertElement: function(){

    Chart.defaults.global.animation = false;

    var canvas  = this.get('element'),
    context = canvas.getContext('2d'),
    data = this.get('data'),
    options = (this.get('options') !== undefined) ? this.get('options') : {},
    type = this.get('type');

    canvas.width = this.$().parent().outerWidth();
    canvas.height = this.$().parent().outerHeight();

    _.extend(options, this.get('defaultOptions'));
    console.log(options);

    if(!type.match(/(Line|Bar|Radar|PolarArea|Pie|Doughnut)/)) type = "Line";

    this.setProperties({
      '_data': data,
      '_type': type,
      '_canvas':  canvas,
      '_context': context,
      '_options': options
    });
    this.chartRender();
    // var chartObject = new Chart(this.get('_context'));
    // var chart = chartObject[this.get('_type')](this.get('_data'),this.get('_options'));
    // this.setProperties({
    //   '_chart': chart,
    //   '_chartObj': chartObject,
    //   'setup': true
    // });

  },

  /**
   * Render the chart to the canvas
   * This function is separated from the event hook to
   * allow data overwriting which more or less results
   * in updating the chart.
   */
  chartRender: function(){
    var chart = new Chart(this.get('_context'))[this.get('_type')](this.get('_data'),this.get('_options'));
    this.setProperties({
      '_chart': chart,
      'setup': true
    });
  },
 
  /**
   * Chart Update Handler
   * This will re-render the chart whenever its data or
   * options changes, if the 'update' property is set to true
   */
  chartUpdate : function() {
      // if (this.get('update') === true && this.get('setup') == true) {
    this.setProperties({
        '_data' : this.get('data'),
        '_options' : this.get('options')
    });
    this.chartRender();
  }.observes('data', 'options')
});