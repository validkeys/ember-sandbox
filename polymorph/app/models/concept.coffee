`import Commentable from "polymorph/models/commentable"`
Concept = Commentable.extend
  title: DS.attr 'string'

Concept.reopenClass
  FIXTURES:[
    id: 1,
    title: "Concept 1",
    comments: [1]
  ,
    id: 2,
    title: "Concept 2",
    comments: []
  ]

`export default Concept;`
