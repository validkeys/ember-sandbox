Bucket = DS.Model.extend
  title:    DS.attr       'string'
  concepts: DS.hasMany    'concept', async: true
  project:  DS.belongsTo  'project'
  default:  DS.attr       'boolean'

Bucket.reopenClass
  FIXTURES:[
    id:       1
    title:    "Bucket 1"
    concepts: [1,2],
    default:  false
  ,
    id:       2
    title:    "Bucket 2"
    concepts: []
    default:  true
  ]

`export default Bucket;`