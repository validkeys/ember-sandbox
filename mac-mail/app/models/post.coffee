Post = DS.Model.extend
  body:     DS.attr 'string'
  concept:  DS.belongsTo 'concept'

Post.reopenClass
  FIXTURES: [
    id:       1
    body:     "Post 1!"
    concept:  1
  ,
    id:       2
    body:     "Post 2!"
    concept:  1
  ,
    id:       3
    body:     "Post 3!"
    concept:  1
  ,
    id:       4
    body:     "Post 4!"
    concept:  1      
  ]

`export default Post;`