Label = DS.Model.extend
  title: DS.attr 'string'
  labeled_items: DS.hasMany 'labeled_item', async: true

Label.reopenClass
  FIXTURES:[
    id: 1
    title: "label 1"
  ,
    id: 2
    title: "label 2"
  ,
    id: 3
    title: "label 3"
  ]

`export default Label;`
