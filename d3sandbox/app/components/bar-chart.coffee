BarChartComponent = Ember.Component.extend

  tagName: "svg"

  attributeBindings: ['width','height']

  debug: true

  chartWidth:   420
  chartHeight:  150
  width:  Ember.computed.alias('chartWidth')
  height: Ember.computed.alias('chartHeight')

  barWidth:(->
    @get('chartWidth') / @get('data.length')
  ).property('chartWidth')

  data: [
    result: 1
  ,
    result: 100
  ,
    result: 320
  ,
    result: 480
  ,
    result: 55
  ,
    result: 250
  ,
    result: 320
  ,
    result: 400
  ,
    result: 450

  ]

  scaleFactor:(->

    d3.scale.linear()
      .domain( [0, d3.max(@get('data'), (d) -> d.result)] )
      .range( [0,  @get('chartHeight')] )

  ).property()

  buildChart:(->

    x = @get('scaleFactor')

    chart = d3.select(@$()[0])
      .selectAll("g")
        .data(@get('data'))
      .enter()
        .append("rect")
          .attr('height', (d, i) -> x(d.result) )
          .attr('width',@get('barWidth') - 1)
          .attr('x', (d,i) => i * @get('barWidth'))
          .attr('y',@get('chartHeight'))
          .transition()
          .duration(1200)
          .attr('y', (d,i) => @get('chartHeight') - x(d.result))
          .attr('fill', (d) -> "rgb(0,"+(d.result)+","+(d.result)+")")


  ).on('didInsertElement')


  printDebug:(->
    Ember.debug "===============BAR CHART==============="
    Ember.debug "Chart Width: #{@get('chartWidth')}"
    Ember.debug "Bar Width: #{@get('barWidth')}"
    console.debug @get('data')
    Ember.debug "---------------------------------------"
  ).on('didInsertElement')

`export default BarChartComponent;`
