import Ember from 'ember';

export default Ember.ArrayController.extend({

  dataForChart: function(){
    console.log("Setting up data for chart!");
    var data = this.get('model');
    var structure = {
      labels:   [],
      datasets: []
    };

    structure.labels = data.map(function(item){
      return item.get("date");
    });

    var dataSet = {
      // label: "My First dataset",
      fillColor: "rgba(220,220,220,0.5)",
      strokeColor: "rgba(220,220,220,0.8)",
      highlightFill: "rgba(220,220,220,0.75)",
      highlightStroke: "rgba(220,220,220,1)",
      data: data.map(function(item){ return item.get("count") })
    }

    structure.datasets.push(dataSet);
    return structure;

  }.property('model.[]')

});