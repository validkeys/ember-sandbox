Comment = DS.Model.extend
  title: DS.attr 'string'
  commentable: DS.belongsTo 'commentable'

Comment.reopenClass
  FIXTURES: [
    id: 1
    title: "Comment 1 title"
    commentable:
      id: 1
      type: "concept"
  ]

`export default Comment;`
