Post = DS.Model.extend
  title: DS.attr 'string'
  labeled_items: DS.hasMany 'labeled_item', async: true

Post.reopenClass
  FIXTURES: [
    id: 1
    title: "Post 1"
    labeled_items: [1,2]
  ]

`export default Post;`
