Post = DS.Model.extend
  title: DS.attr 'string'

Post.reopenClass
  FIXTURES:[
    id: 1,
    title: "Post 1"
  ,
    id: 2,
    title: "Post 2"
  ]

`export default Post;`
