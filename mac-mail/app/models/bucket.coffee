Bucket = DS.Model.extend
  title:    DS.attr     'string'
  concepts: DS.hasMany  'concept', async: true

Bucket.reopenClass
  FIXTURES:[
    id: 1
    title: "Bucket 1"
    concepts: [1,2]
  ,
    id: 2
    title: "Bucket 2"
    concepts: []  
  ]

`export default Bucket;`