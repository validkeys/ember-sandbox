Email = DS.Model.extend
  title:       DS.attr 'string'
  description: DS.attr 'string'
  links:       DS.hasMany 'link'

`export default Email`
