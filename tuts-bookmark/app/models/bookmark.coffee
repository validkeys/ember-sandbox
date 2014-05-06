Bookmark = DS.Model.extend
  title:    DS.attr 'string'
  url:      DS.attr 'string'
  favorite: DS.attr 'boolean'
  
Bookmark.reopenClass
  FIXTURES: [
    id:       1
    title:    "FIXTURE"
    url:      "www.fixture.com"
    favorite: false
  ]

`export default Bookmark;`