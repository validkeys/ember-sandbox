Commentable = DS.Model.extend
  comments: DS.hasMany 'comment',
    async: true

`export default Commentable;`
