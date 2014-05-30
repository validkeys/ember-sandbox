Link = DS.Model.extend
  title:         DS.attr 'string'
  author_name:   DS.attr 'string'
  thumbnail_url: DS.attr 'string'
  description:   DS.attr 'string'
  article:       DS.belongsTo 'article'
