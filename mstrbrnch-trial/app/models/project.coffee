Project = DS.Model.extend
  title:        DS.attr('string')
  description:  DS.attr('string')
  buckets:      DS.hasMany('bucket', async: true)

  defaultBucket:(->
    @get('buckets').then (data) ->
      data.filterProperty('default', true).objectAt(0)
  ).property('buckets.@each')

Project.reopenClass
  FIXTURES: [
    id: 1,
    title: "Project 1",
    description: 'This is project 1\'s description',
    buckets: [1,2]
  ,
    id: 2,
    title: "Project 2",
    description: 'This is project 2\'s description',
    buckets: [3,4]
  ]

`export default Project;`