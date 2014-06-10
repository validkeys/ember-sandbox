Bucket = DS.Model.extend
  name:     DS.attr('string')
  default:  DS.attr('boolean')
  concepts: DS.hasMany('concept', {async: true})
  project:  DS.belongsTo('project')

Bucket.reopenClass
  FIXTURES: [
    id: 1
    name: "Bucket 1"
    concepts: [1,2]
    project_id: 1
    default: true
  ,
    id: 2
    name: "Bucket 2"
    concepts: [3]
    project_id: 1
    default: false
  ,
    id: 3
    name: "Bucket 3"
    concepts: [4]
    project_id: 2
    default: true
  ,
    id: 4,
    name: "Bucket 4"
    concepts: []
    project_id: 2
    default: false
  ]

`export default Bucket`