Concept = DS.Model.extend
  title:         DS.attr 'string'
  description:   DS.attr 'string'
  bucket:        DS.belongsTo 'bucket'

Concept.reopenClass
  FIXTURES:[
    id:     1
    title:  "Concept 1"
    description: "..."
    bucket: 1
  ,
    id:     2
    title:  "Concept 2"
    description: "..."
    bucket: 2
  ]

`export default Concept;`