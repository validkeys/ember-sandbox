Concept = DS.Model.extend
  title:         DS.attr 'string'
  description:   DS.attr 'string'
  bucket:        DS.belongsTo 'bucket'
  posts:         DS.hasMany 'post', async: true

Concept.reopenClass
  FIXTURES:[
    id:           1
    title:        "Concept 1"
    description:  "..."
    bucket:       1
    posts:         [1,2,3,4]
  ,
    id:           2
    title:        "Concept 2"
    description:  "..."
    bucket:       2
    posts:         []
  ]

`export default Concept;`