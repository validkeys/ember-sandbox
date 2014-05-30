LabeledItem = DS.Model.extend
  label: DS.belongsTo 'label'
  post: DS.belongsTo 'post'

LabeledItem.reopenClass
  FIXTURES: [
    id: 1
    post: 1
    label: 1
  ,
    id: 2
    post: 1
    label: 2
  ]

`export default LabeledItem;`
