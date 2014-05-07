Project = DS.Model.extend
  title:    DS.attr 'string'
  buckets:  DS.hasMany 'bucket', async: true

  defaultBucket:(->
    @get('buckets').filterProperty('default',true).objectAt(0)
  ).property('buckets.@each')

Project.reopenClass
  FIXTURES: [
    id: 1
    title: "Project 1"
    buckets: [1,2]
  ]

`export default Project;`